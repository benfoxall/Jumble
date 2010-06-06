class Item < ActiveRecord::Base
  belongs_to :cause
  belongs_to :user
  has_many :payments #might be failed payments
  
  validates_presence_of :cause_id
  validates_associated :cause
  
  # todo - don't allow update via multi_update
  validates_presence_of :user, :message => 'must be logged in'
  validates_associated :user
  
  
  validates_presence_of :title
  validates_presence_of :description
  
  validates_numericality_of :price, :only_integer => true, :greater_than => 0
  validates_numericality_of :postage, :only_integer => true  # todo - less than price
  validates_numericality_of :donation, :only_integer => true, :greater_than => 0  # todo - less than price
  
  def service_charge
    ((price + postage)/20.0).ceil
  end
  
  def pay_breakdown
    {
      :postage => postage,
      :donation => donation,
      :price => price - donation,
      :service_charge => service_charge()
    }
  end
  
  def pay_shares
    {
      :site => service_charge(),
      :seller => (price - donation) + postage,
      :cause => donation
    }
  end
  
  def pay_request_data
    {
      "returnUrl" => "http://jumble.local/payments/completed_payment_request",
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"GBP",
      "receiverList"=>{"receiver"=>
           [
              {"email" => SITE_PP_EMAIL,        "amount"=> service_charge() , "primary"=>"true"},
              {"email" => cause.user.email,     "amount"=> donation , "primary"=>"false"},
              {"email" => user.email,           "amount"=> seller, "primary"=>"false"}
           ]},
      "cancelUrl"=>"http://testserver.com/payments/canceled_payment_request",
      "actionType"=>"PAY",
      "ipnNotificationUrl"=>"http://jumble.local/payments/ipn_notification"
    }
  end
  
end
