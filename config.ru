$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'config/application'

use OTR::ActiveRecord::ConnectionManagement
run GrapeOAuth2Sample::API
