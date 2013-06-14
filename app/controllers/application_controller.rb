class ApplicationController < ActionController::Base

  before_filter :set_i18n_locale_from_params
  protect_from_forgery
  include SessionsHelper
    
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
end
