class Cause < ActiveRecord::Base
  attr_protected :user_id
  
  has_many :items, :order => 'id DESC', :dependent => :destroy
  validates_presence_of :title
  belongs_to :user
  
  validates_presence_of :user, :message => 'must be logged in'
  validates_associated :user
  
end

