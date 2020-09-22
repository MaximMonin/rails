class SocialsController < ApplicationController
 def index
 end
 
 def create
   omniauth = request.env['omniauth.auth']
   provider = omniauth['provider']
   uid = omniauth['uid']
   email = ''
   username = ''

   if provider == 'facebook' || provider == 'twitter' || provider == 'vkontakte' || provider == 'github'
     email = omniauth['info']['email']
     username = omniauth['info']['name']
   end
   render :plain => request.env["omniauth.auth"].to_yaml
 end

 def failure
    set_flash_message :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
    redirect_to new_user_session_path
  end

  protected

  def failed_strategy
    request.respond_to?(:get_header) ? request.get_header("omniauth.error.strategy") : request.env["omniauth.error.strategy"]
  end

  def set_flash_message(key, kind, options = {})
    message = options[:kind] + ": " + options[:reason]
    if options[:now]
      flash.now[key] = message if message.present?
    else
      flash[key] = message if message.present?
    end
  end

  def failure_message
    exception = request.respond_to?(:get_header) ? request.get_header("omniauth.error") : request.env["omniauth.error"]
    error   = exception.error_reason  if exception.respond_to?(:error_reason)
    error ||= exception.error         if exception.respond_to?(:error)
    error ||= (request.respond_to?(:get_header) ? request.get_header("omniauth.error.type") : request.env["omniauth.error.type"]).to_s
    error.to_s.humanize if error
  end

  def after_omniauth_failure_path_for(scope)
    new_session_path(scope)
  end

  def translation_scope
    'devise.omniauth_callbacks'
  end
end
