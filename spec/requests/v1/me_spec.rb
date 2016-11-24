require 'spec_helper'

describe 'Me' do
  let(:application) { Application.create(name: 'App1') }
  let(:user) { User.create(username: 'Jack Sparrow', password: '12345678') }

  context 'with access token' do
    it 'returns data without authorization for public route' do
      access_token = AccessToken.create_for(application, user)

      get 'api/v1/me', access_token: access_token.token

      expect(last_response.status).to eq 200
      expect(json_body).to include(:id, :username)
    end
  end

  context 'without access token' do
    it 'returns data without authorization for public route' do
      get 'api/v1/me'

      expect(last_response.status).to eq 401
      expect(json_body[:error]).to eq('unauthorized')
    end
  end
end
