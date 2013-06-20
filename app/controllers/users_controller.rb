class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update]
  before_filter :correct_user,   only: [:edit, :update] 
  
  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:avatar] && @user. avatar  
      old_avatar = User.find(params[:id]).avatar  # 重新取user备用  
    end 
    if @user.update_attributes(params[:user])
      old_avatar.remove! if old_avatar
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
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
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
end
