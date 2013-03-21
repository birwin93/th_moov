

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/facebook.yml")).result)[Rails.env]
  provider :facebook, CONFIG['app_id'], CONFIG['secret']
end
