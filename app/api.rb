module GrapeOAuth2Sample
  class API < ::Grape::API
    format :json
    prefix :api

    include GrapeOAuth2.api

    desc 'Root action'

    get '/' do
      { error: ['Please check API documentation'] }
    end

    mount ::GrapeOAuth2Sample::V1::Base
  end
end
