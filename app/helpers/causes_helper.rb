module CausesHelper
  # this gives a link to be appended to the end of a block of text
  def edit_link
    ' ' << link_to('<small>edit</small>', edit_cause_path)
  end
  
  def active?
    unless @cause.nil?
      @cause.confirmed
    else
      false
    end
  end
  def owner?
    
    return false if @cause.nil?
    
    session.key? "cause-#{@cause.id}"
    
  end
end
