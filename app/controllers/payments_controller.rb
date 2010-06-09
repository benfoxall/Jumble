class PaymentsController < ApplicationController
  before_filter :is_admin, :only => :index
  before_filter :logged_in
  
  def new
    @payment = Payment.new
    set_protected_attribs
  end
  
  def create
    @payment = Payment.create(params[:payment])
    set_protected_attribs
    
    if @payment.save
      redirect_to item_payment_path(:id => @payment.id, :item_id => @payment.item_id)
    else
      render :new
    end
  end
  
  def show
    @payment = Payment.find params[:id]
    if @payment.user != UserSession.find.user
      flash[:error] = "Payment user does not match session"
      redirect_to @payment.item
    end
  end
  
    # 
    # def index
    #   @payments = Payment.all
    # end
    # 
    # def create
    #   @payment = Payment.create(params[:payment])
    #   if @payment.save
    #     render :edit
    #   else
    #     flash[:error] =
    #       if @payment.errors.on(:terms)
    #         "Terms must be accepted"
    #       else
    #         "You need to be logged in to continue"
    #       end
    #     redirect_to buy_item_path(@payment.item) || '/'
    #   end
    # end
    # 
    # def edit
    # end
    # 
    # def update
    #   @payment = Payment.find params[:id]
    #   @payment.update_attributes(params[:payment])
    #   render :show
    # end
    # 
    # def cancel
    #   payment = Payment.find params[:id]
    #   payment.cancel!
    #   flash[:notice] = "Payment cancelled"
    #   redirect_to payment.item
    # end
    # 
  protected
  
  def set_protected_attribs(payment = @payment)
    # these two attributes are protected, so can only be applied here    
    payment.user = UserSession.find.user
    payment.item = Item.find params[:item_id]
  end
  
  def logged_in
    unless UserSession.find
      flash[:error] = 'You must be logged in to make a payment'
      redirect_to  buy_item_path(Item.find(params[:item_id]))|| '/'
    end
  end
end
