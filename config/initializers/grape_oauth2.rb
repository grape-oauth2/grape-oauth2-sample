GrapeOAuth2.configure do |config|
  config.client_class_name = 'Application'
  config.access_token_class_name = 'AccessToken'
  config.access_grant_class_name = 'AccessCode'
  config.resource_owner_class_name = 'User'

  config.realm = 'Sample Grape::OAuth2'

  config.allowed_grant_types << 'refresh_token'
end
