# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  
  def make_claim(code,user)
    unless code.nil?
      logger.info "processing claim code : #{code}"
      vals = code.split ':'
      c = Cause.find vals[1].to_i
      if c.claim_code == vals[2]
        c.update_attribute :user_id, user.id
      else
        logger.info 'Not claimed,  even though claim code was given'
      end
    end
  end
  
end
