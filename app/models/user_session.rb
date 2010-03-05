class UserSession < Authlogic::Session::Base
  
    attr_accessor :claim_code
    
    # def before_save
    #   debugger
    #   unless @claim_code.blank?
    #     
    #     logger.info "processing claim code : #{@claim_code}"
    #     vals = @claim_code.split ':'
    #     c = Cause.find vals[1].to_i
    #     if c.claim_code == vals[2]
    #       c.update_attribute :user_id, self.id
    #     else
    #       logger.info 'Not claimed,  even though claim code was given'
    #     end
    #   end
    # end
end