module GrapeOAuth2Sample
  module V1
    class Base < ::Grape::API
      version 'v1', using: :path

      mount ::GrapeOAuth2Sample::V1::Endpoints::Posts

      desc 'Information about current resource owner'

      get '/me' do
        access_token_required!

        present(current_resource_owner, with: Entities::User)
      end
    end
  end
end
