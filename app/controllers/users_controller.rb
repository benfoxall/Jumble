class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      render :update do |page|
        page.hide 'auth'
      end
    else
      render :action => :new, :layout => false
    end
  end

end
