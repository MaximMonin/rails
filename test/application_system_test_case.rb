ActiveRecord::Base.maintain_test_schema = false
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1600, 1080], options: {
    url: "http://selenium:4444/wd/hub",
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless window-size=1600x1080] },
    )
  }
  def setup
    ENV['RAILS_ENV'] = 'test'
    Rails.env = "test"
    super

#    ActiveRecord::Base.establish_connection("postgres://rails:rails@db/rails_test")
    ActiveRecord::Base.establish_connection (:test)

    Capybara.configure do |config|
      config.run_server = false
      config.app_host = 'http://nginxtest'
    end
  end
end