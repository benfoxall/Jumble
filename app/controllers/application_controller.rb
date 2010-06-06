# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  protected
  
  def in_beta
    unless UserSession.find && UserSession.find.user.beta
      render 'site/in_beta'
    end
  end
  
  def store_return
    cookies[:return] ||= params[:return]
  end
  
  def redirect_return(fallback = '/')
    redirect_to cookies[:return] || fallback
    cookies.delete :return
  end
  
end
