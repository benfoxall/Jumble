class UsersController < ApplicationController
  before_filter :store_return, :only => :new
  def new
    @user = User.new  
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      flash[:notice] = "Welcome Aboard!"
      redirect_return
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
