class UserSessionsController < ApplicationController
  before_filter :store_return, :only => :new
    
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save 
      redirect_return
    else
      render :new
    end

  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_return
  end
  
end