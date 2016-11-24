module GrapeOAuth2Sample
  module V1
    module Entities
      class Post < Grape::Entity
        expose :id
        expose :name
        expose :body
      end
    end
  end
end
