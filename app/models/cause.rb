class Cause < ActiveRecord::Base
  has_many :items, :order => 'id DESC'
  validates_presence_of :title
end
