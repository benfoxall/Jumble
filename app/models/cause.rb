class Cause < ActiveRecord::Base
  has_many :items, :order => 'id DESC', :dependent => :destroy
  validates_presence_of :title
end