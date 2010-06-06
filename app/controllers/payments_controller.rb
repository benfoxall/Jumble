class PaymentsController < ApplicationController
  
  def create
    @payment = Payment.create(params[:payment])
    if @payment.save
      render :edit
    else
      flash[:error] =
        if @payment.errors.on(:terms)
          "Terms must be accepted"
        else
          "You need to be logged in to continue"
        end
      redirect_to buy_item_path(@payment.item) || '/'
    end
  end
  
  def edit
  end
  
  def update
    @payment = Payment.find params[:id]
    @payment.update_attributes(params[:payment])
    render :show
  end

end
