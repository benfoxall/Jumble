class Cause < ActiveRecord::Base
  # module Authentication
  #   mattr_accessor :email_regex, :email_name_regex, :domain_head_regex, :domain_tld_regex
  #   self.email_name_regex  = '[\w\.%\+\-]+'.freeze
  #   self.domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
  #   self.domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  #   self.email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
  # end
  
  has_many :items, :order => 'id DESC', :dependent => :destroy
  validates_presence_of :title
  belongs_to :user
  
  
  validates_presence_of :user, :message => 'must be logged in'
  validates_associated :user
  
  
  protected
  
  def generate_claim_code
    self.claim_code = Digest::SHA1.hexdigest rand.to_s
  end
  
  # validates_format_of       :email, :with => Authentication.email_regex, :allow_nil => false
  
  
  # before_create :generate_login
  
  # protected
  
  # def generate_login
  #   self.login_hash = Digest::SHA1.hexdigest rand.to_s
  # end
  
end

