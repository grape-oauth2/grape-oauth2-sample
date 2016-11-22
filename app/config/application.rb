require 'bundler/setup'
Bundler.setup

require 'dotenv'
Dotenv.load(File.expand_path('.env.local'), File.expand_path('.env'))

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
require_relative '../models/application_record'

%w(access_token access_code application post user).each do |model|
  require_relative "../models/#{model}"
end

# Entities
Dir[File.expand_path('../../entities/*.rb', __FILE__)].each do |entity|
  require_relative entity
end

# Endpoints
Dir[File.expand_path('../../endpoints/*.rb', __FILE__)].each do |endpoint|
  require_relative endpoint
end

require_relative '../../app/api'
