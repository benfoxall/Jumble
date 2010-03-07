class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      render :update do |page|
        page.hide 'auth'
      end
    else
      render :action => 'new', :layout => false
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to '/'
  end
  
end