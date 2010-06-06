class Message < ActiveRecord::Base
  before_validation_on_create :assign_to_current_user
  belongs_to :user
  belongs_to :conversation
  
  validates_presence_of :user, :message => 'must be logged in to send a message'
  validates_associated :user
  
  validates_presence_of :content

  
  def assign_to_current_user
    if UserSession.find
      self.user = UserSession.find.user 
    end
  end
  
  def redirect
    return conversation.path || '/'
    # return item unless item.nil?
    # return user unless user.nil?
    # return '/'
  end
  
end
