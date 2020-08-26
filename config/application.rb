require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.i18n.available_locales = [:en, :ru, :uk]
    config.i18n.default_locale = :en
    config.i18n.locale = :en

    config.action_cable.mount_path = '/websocket'
    config.action_cable.allowed_request_origins = ['https://' + ENV['VIRTUAL_HOST'], 'http://railsnginx']

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_caching = false
    config.action_mailer.default_url_options = { host: 'https://' + ENV['VIRTUAL_HOST'] }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:         ENV['SMTP_ADDRESS'],
      port:            ENV['SMTP_PORT'],
      domain:          ENV['SMTP_DOMAIN'],
      user_name:       ENV['SMTP_USERNAME'],
      password:        ENV['SMTP_PASSWORD'], 
      authentication: 'login',
      tls:             true,
      enable_starttls_auto: true,
    }
    config.action_mailer.default_options = {from: 'no-reply@' + ENV['VIRTUAL_HOST']}

    config.active_job.queue_adapter = :sidekiq

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
