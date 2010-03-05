class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      make_claim(params[:user_session][:claim_code],@user_session.user.id)

      render :update do |page|
        page.hide 'claim_div'
      end
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to '/'
  end
  
end