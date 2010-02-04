class CauseObserver < ActiveRecord::Observer
  def after_create(cause)
    Confirm.deliver_cause(cause)
  end
end
