class Item < ActiveRecord::Base
  belongs_to :cause
  belongs_to :user
  
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
    (price/20.0).ceil
  end
  
end
