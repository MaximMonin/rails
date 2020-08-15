class LocaleController < ApplicationController
  def set
    locale = params[:locale]
    raise 'unsupported locale' unless ['en', 'ru', 'uk' ].include?(locale)
    I18n.locale = locale
    redirect_back fallback_location: root_path
  end
end
