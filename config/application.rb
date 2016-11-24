require 'bundler/setup'
Bundler.setup

require 'dotenv'
Dotenv.load(File.expand_path('.env.local'), File.expand_path('.env'))

require 'rack/cors'

require 'otr-activerecord'
require 'grape'
require 'grape-entity'
require 'grape_oauth2'

# Initializers
Dir[File.expand_path('../initializers/*.rb', __FILE__)].each do |initializer|
  require_relative initializer
end

# Database
load File.expand_path('../database.rb', __FILE__)

# Models
require_relative '../app/models/application_record'

%w(access_token access_code application post user).each do |model|
  require_relative "../app/models/#{model}"
end

# Entities
Dir[File.expand_path('../../app/v1/entities/*.rb', __FILE__)].each do |entity|
  require_relative entity
end

# Endpoints
Dir[File.expand_path('../../app/v1/endpoints/*.rb', __FILE__)].each do |endpoint|
  require_relative endpoint
end

# Versioned APIs
require_relative '../app/v1/base'

require_relative '../app/api'
