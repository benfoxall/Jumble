class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      render :update do |page|
        # page.hide 'auth'
        page.replace_html 'user_bar', :partial => 'site/user', :object => @user
      end
    else
      render :update do |page|
        page.replace_html 'signup', :partial => 'new', :object => @user
      end
      # render :action => :new, :layout => false
    end
  end

end
