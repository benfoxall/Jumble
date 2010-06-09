# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  protected
  
  
  # a quick refactored method to see if someone is logged in
  def logged_in(as_attr = nil)
    return false unless UserSession.find #not logged in
    return true  unless as_attr # is nil (no-one in particular)
    return UserSession.find.user[as_attr] == true 
  end
  
  # before filters to use the above method
  def in_beta
    render 'site/in_beta' unless logged_in(:beta)
  end
  
  def is_admin
    redirect_to '/' unless logged_in(:admin)
  end
  
  
  # if a 'return' param was sent,  store it so that it can be
  # returned to later (ie. once a user has logged in)
  def store_return
    cookies[:return] ||= params[:return]
  end
  
  # if a 'return' cookie was stored,  then redirect to it.
  def redirect_return(fallback = '/')
    redirect_to cookies[:return] || fallback
    cookies.delete :return
  end
  
end
