Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV.fetch("TWITTER_API_KEY"), ENV.fetch("TWITTER_API_SECRET"), callback_url: "http://localhost:3000/omniauth/twitter/callback"
end