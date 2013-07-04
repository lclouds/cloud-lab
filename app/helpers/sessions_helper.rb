module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
#    @us = User.find_by_email(params[:session][:email].downcase)
#    @us.last_date=Time.now
    #@us.save(:validate => false)
    #@us.save(false)
#    Parent.transaction do  
#      validate_recorded_records! do    
#            @us.save_and_record_without_validation
 #     end
#   end
#      @user.update_attribute(:last_date,'Time.now.to_s')
#      User.update_columns(last_request_at: Time.current)
#     @us = User.new(:last_date=>Time.now.to_s)
#     @us.save!
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end
  
end

