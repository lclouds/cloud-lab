class UsersController < ApplicationController
  load_and_authorize_resource
  
  before_filter :find_user,      only: [:show, :myclasse, :edit, :update, :destroy, :correct_user]
  before_filter :signed_in_user, only: [:index,:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :clclasses,      only: [:show,:myclasses]
  before_filter :find_class
  
  include ClclassesHelper
  def index
    @users = User.paginate(page: params[:page], :per_page => 5)
  end

  def new
    @user = User.new
  end

  def show
  end

  def find_user
    @user = User.find(params[:id])
  end
  def myclasse
  end

  def search_user
     @users = User.search(params)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
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

  def destroy
    
    @user.destroy
    flash[:success] = "User destroyed."

    redirect_to users_path
  #render 'index'
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@user)
  end

  def clclasses
    @clclasses = Clclass.all
  end
  
  def find_class
      if signed_in?
        @class_ids = ClclassesUser.where(:user_id=>params[:id])
        @class_user = Array.new
      if !@class_ids.nil?
        @class_ids.each do |c|
          @class_user.push(Clclass.find(c.clclass_id))
        end
      end
    end
  end
  
end
