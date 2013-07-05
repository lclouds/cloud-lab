class SessionsController < ApplicationController
  skip_authorization_check
  
  def new
    render 'new'
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = t("welcome")
      #redirect_back_or user
      #redirect_to :controller => 'user', :action => 'myclasses' 
      redirect_to  myclasses_user_path(current_user)
      #render 'users/myclasses.html.erb'
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
