require 'paypal_adaptive'

class Payment < ActiveRecord::Base
  
  # This give the service charge for using this service
  def self.service_charge(amount)
    (amount/20.0).ceil
  end
  
  attr_protected :user_id, :item_id
  
  before_validation_on_create :assign_current_user
  
  belongs_to :item
  belongs_to :user
  
  validates_presence_of :item_id
  validates_associated :item
  
  validates_presence_of :user_id
  validates_associated :user
  
  validates_acceptance_of :terms, :on => :create
  attr_accessor :terms
  
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :town
  validates_presence_of :postcode
  
  #states
  include AASM
  aasm_initial_state :editing

  aasm_state :new
  aasm_state :cancelled
  aasm_state :timeout
  aasm_state :accepted
  
  aasm_event :cancel do
    transitions :from => :new, :to => :cancelled
  end
  
  def pp
    pay_request = PaypalAdaptive::Request.new
    pay_request.pay(pp_data)
  end
  
  def pp_data
    # the request that would have to be satisfied for this
    # payment to be furfilled
    
    payment_root = "http://jumble.local/payments/#{id}"    
    {
      "returnUrl" => "#{payment_root}/complete",
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"GBP",
      "receiverList"=>{"receiver"=>recievers()},
      "cancelUrl"=>"#{payment_root}/cancel",
      "actionType"=>"PAY",
      "ipnNotificationUrl"=>"#{payment_root}/ipn"
    }
  end
  
  protected
  
  def assign_current_user
    if UserSession.find
      self.user = UserSession.find.user 
    end
  end

  private 
  
  def recievers
    payees = item.payees 

    total = 0
    payees.each do |payee|
    	total += payee[:amount]
    	payee[:primary] = "false"
    end 

    total_plus_charge = Payment.service_charge(total) + total

    payees << {:email => SITE_PP_EMAIL, :amount => total_plus_charge, :primary => "true"}
    
    # do a bit of formatting
    payees.each do |payee|
      a = payee[:amount]
      payee[:amount] = a.to_s << '.00'
    end
    
  end
  
  
end
