class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the diandiyun!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
    def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to @user
  end
end
