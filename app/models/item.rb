class Item < ActiveRecord::Base
  belongs_to :cause
  belongs_to :user
  
  
  validates_presence_of :cause_id
  validates_associated :cause
  
  validates_presence_of :user, :message => 'must be logged in'
  validates_associated :user
  
  
  
  validates_presence_of :title
  validates_presence_of :description
  
  validates_numericality_of :price, :only_integer => true
  validates_numericality_of :donation, :only_integer => true
  
  
  
  def charge
    (price/20.0).ceil
  end
end
