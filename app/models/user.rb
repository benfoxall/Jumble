class User < ActiveRecord::Base
  acts_as_authentic
  has_many :items
  
  def short_name
    s = name.split
    l = s.length - 1
    s[l] = s[l].first << '.' if s[l]
    s.join ' '
  end
end
