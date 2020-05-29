Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials.UNSPLASH_ACCESS_KEY
  config.application_secret = Rails.application.credentials.UNSPLASH_SECRET_KEY
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "Magician's Journal"

  # optional:
  # config.logger = MyCustomLogger.new
end