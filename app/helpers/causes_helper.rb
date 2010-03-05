module CausesHelper
  def claimed?(cause = @cause)
    !cause.user.nil?
  end
  
  def owner?
    return false if @cause.nil?
    
    session.key? "cause-#{@cause.id}"
    
  end
end
