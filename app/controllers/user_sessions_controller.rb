class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      render :update do |page|
        page.replace_html 'user_bar', :partial => 'site/user', :object => @user_session.user
      end
    else
      render :update do |page|
        page.replace_html 'login', :partial => 'new', :object => @user_session
      end
      # render :action => 'new', :layout => false
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to '/'
  end
  
end