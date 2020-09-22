Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET']
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_ID'], ENV['GITHUB_SECRET']
  provider :vkontakte, ENV['VK_ID'], ENV['VK_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  on_failure { |env| SocialsController.action(:failure).call(env) }
end