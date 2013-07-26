class ApplicationController < ActionController::Base

  before_filter :set_i18n_locale_from_params
  protect_from_forgery
  include SessionsHelper
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/error_auth', :alert => exception.message
    flash[:success] = "CanCan::AccessDenied"
  end
  rescue_from ActiveRecord::RecordNotFound  do |exception|
    redirect_to '/error_auth', :alert => exception.message
    flash[:success] = "ActiveRecord::RecordNotFound"
  end

  # rescue_from ActionController::RoutingError, :with => :render_404

  protected

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale=params[:locale]
        session[:locale] = params[:locale]
      else
        flash.now[:notice]="#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def default_url_options
    {:locale => I18n.locale}
  end

  # def render_404(exception = nil)
    # if exception
      # logger.info "Rendering 404: #{exception.message}"
    # end
# 
    # render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  # end
end