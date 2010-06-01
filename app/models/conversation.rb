class Conversation < ActiveRecord::Base
  has_many :messages, :order => 'created_at DESC'
  validates_uniqueness_of :path
end
