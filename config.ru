$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'config/application'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end

use OTR::ActiveRecord::ConnectionManagement
run GrapeOAuth2Sample::API
