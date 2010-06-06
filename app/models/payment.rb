class Payment < ActiveRecord::Base
  
  before_validation_on_create :assign_current_user
  
  belongs_to :item
  belongs_to :user
  
  validates_presence_of :item_id
  validates_associated :item
  
  validates_presence_of :user_id
  validates_associated :user
  
  validates_acceptance_of :terms, :on => :create
  attr_accessor :terms
  
  protected
  
  def assign_current_user
    if UserSession.find
      self.user = UserSession.find.user 
    end
  end
  
end
