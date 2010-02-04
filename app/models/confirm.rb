class Confirm < ActionMailer::Base
  

  def cause(cause)
    recipients cause.email
    from       'jumble@bfoxall.com'
    subject    'Testing from rails'
    body       :cause => cause, :host => Rails.env.production? ? 'https://jumble.heroku.com' : 'http://jumble.local'
  end

  # def item(recipient,confirmation_code)
  #   subject    'Confirm#item'
  #   recipients recipient
  #   from       'Jumble <jumble@bfoxall.com>'
  #   sent_on    Time.now
  #   
  #   body       :confirmation_code => confirmation_code
  # end

end
