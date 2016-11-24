require 'spec_helper'

describe 'Protected Resources' do
  let(:application) { Application.create(name: 'App1') }
  let(:user) { User.create(username: 'Jack Sparrow', password: '12345678') }

  let(:user_post) { Post.create(name: 'Test', body: 'Post body', user: user) }

  context 'public endpoints' do
    it 'returns data without authorization for public route' do
      2.times do |index|
        Post.create(name: "post ##{index}", body: 'Body')
      end

      get 'api/v1/posts'

      expect(last_response.status).to eq 200
      expect(json_body.size).to eq(2)
    end
  end

  context 'protected endpoints' do
    it 'returns Unauthorized without token' do
      get "api/v1/posts/#{user_post.id}"

      expect(last_response.status).to eq 401
      expect(json_body[:error]).to eq('unauthorized')
    end

    it 'returns Forbidden with token that does not has required scopes' do
      access_token = AccessToken.create_for(application, user)

      get "api/v1/posts/#{user_post.id}", access_token: access_token.token

      expect(last_response.status).to eq 403
      expect(json_body[:error]).to eq('forbidden')
    end

    it 'returns Forbidden with expired token' do
      access_token = AccessToken.create_for(application, user, 'read')
      access_token.update(expires_at: (Time.now - 24000).utc)

      get "api/v1/posts/#{user_post.id}", access_token: access_token.token

      expect(last_response.status).to eq 403
      expect(json_body[:error]).to eq('forbidden')
    end

    it 'returns Forbidden with revoked token' do
      access_token = AccessToken.create_for(application, user, 'read')
      access_token.update(revoked_at: (Time.now - 24000).utc)

      get "api/v1/posts/#{user_post.id}", access_token: access_token.token

      expect(last_response.status).to eq 403
      expect(json_body[:error]).to eq('forbidden')
    end

    it 'returns posts with valid token' do
      access_token = AccessToken.create_for(application, user, 'read')

      get "api/v1/posts/#{user_post.id}", access_token: access_token.token

      expect(last_response.status).to eq 200
      expect(json_body).to include(:id, :name, :body)
    end

    it 'does not creates a Post with invalid token' do
      access_token = AccessToken.create_for(application, user, 'read')

      post 'api/v1/posts', name: 'Super post', body: 'Body', access_token: access_token.token

      expect(last_response.status).to eq 403
      expect(Post.count).to be_zero
    end

    it 'creates a Post with valid token' do
      access_token = AccessToken.create_for(application, user, 'read write')

      expect {
        post 'api/v1/posts', name: 'Super post', body: 'Body', access_token: access_token.token
      }.to change { Post.count }.from(0).to(1)

      expect(last_response.status).to eq 201
      expect(json_body).to include(:id, :name, :body)
    end
  end
end
