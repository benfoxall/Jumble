require 'paypal_adaptive'

class SiteController < ApplicationController
  def home
    response.headers['Cache-Control'] = 'public, max-age=300'
  end
  def user_bar
    render :layout => false
  end
  
  def payment
    pay_request = PaypalAdaptive::Request.new

    data = {
      "returnUrl" => "http://jumble.local/payments/completed_payment_request",
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"USD",
      "receiverList"=>{"receiver"=>
           [
             {"email"=>"sg_adm_1275573034_biz@gmail.com", "amount"=>"11.00", "primary"=>"true"},
             {"email"=>"testpp_1261697850_per@nextsprocket.com", "amount"=>"10.00", "primary"=>"false"}
           ]},
      "cancelUrl"=>"http://testserver.com/payments/canceled_payment_request",
      "actionType"=>"PAY",
      "ipnNotificationUrl"=>"http://jumble.local/payments/ipn_notification"
    }

    @pay_response = pay_request.pay(data)

    if @pay_response.success?
      # redirect_to @pay_response.approve_paypal_payment_url
    else
      puts @pay_response.errors.first['message']
      # redirect_to failed_payment_url
    end
  end
end
