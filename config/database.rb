# Dotenv required to be boot first!
OTR::ActiveRecord.configure_from_file!(File.expand_path('../database.yml', __FILE__))

env = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
log_file = File.expand_path("../../log/#{env}.log", __FILE__)

::ActiveRecord::Base.default_timezone = :utc
::ActiveRecord::Base.logger = Logger.new(log_file, File::WRONLY | File::APPEND)

::ActiveRecord::Migration.verbose = false
