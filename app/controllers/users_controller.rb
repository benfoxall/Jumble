class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      render :update do |page|
        page.hide 'claim_div'
      end
    else
      render :action => :new
    end
  end

end
