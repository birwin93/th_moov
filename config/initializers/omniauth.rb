

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "409766955770633", "e0c1dea147be7ab254ca74f085f99b5e"
end
