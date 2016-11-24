module GrapeOAuth2Sample
  module V1
    module Endpoints
      class Posts < Grape::API
        resources :posts do
          desc 'Get all the posts without authorization'

          get '/' do
            posts = Post.take(20)
            present(posts, with: GrapeOAuth2Sample::V1::Entities::Post)
          end

          desc 'Read post by ID only if it belongs to authorized author'

          params do
            requires :id, type: Integer, desc: 'ID of the post'
          end

          get ':id', scopes: [:read] do
            access_token_required!

            post = current_resource_owner.posts.find(params[:id])
            present(post, with: GrapeOAuth2Sample::V1::Entities::Post)
          end

          desc 'Create post from authorized user'

          params do
            requires :name, type: String, desc: 'Post name'
            requires :body, type: String, desc: 'Post body'
          end

          post '/', scopes: [:write] do
            access_token_required!

            post = current_resource_owner.posts.create!(declared(params))
            present(post, with: GrapeOAuth2Sample::V1::Entities::Post)
          end
        end
      end
    end
  end
end
