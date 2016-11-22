ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
Bundler.setup

require 'coveralls'

if Coveralls.should_run?
  Coveralls.wear!
else
  require 'simplecov'
  SimpleCov.start
end

require 'rack/test'
require 'database_cleaner'

require_relative '../config/application'

require 'support/api_helper'

RSpec.configure do |config|
  config.include ApiHelper

  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:deletion)
  end

  config.around(:example) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
