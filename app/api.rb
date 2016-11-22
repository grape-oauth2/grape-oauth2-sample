module GrapeOAuth2Sample
  class API < ::Grape::API
    format :json
    prefix :api

    include GrapeOAuth2.api

    mount ::GrapeOAuth2Sample::Endpoints::Posts

    desc 'Root'

    get '/' do
      { error: ['Please check API documentation'] }
    end
  end
end
