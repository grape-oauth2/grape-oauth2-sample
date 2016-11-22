module GrapeOAuth2Sample
  module Entities
    class Post < Grape::Entity
      expose :id
      expose :name
      expose :body
    end
  end
end
