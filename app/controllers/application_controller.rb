class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
 
  def switch_locale(&action)
    locale = session[:locale] || I18n.default_locale
    I18n.locale = locale
    I18n.with_locale(locale, &action)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :avatar, :photo ])
  end
end
