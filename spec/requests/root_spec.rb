require 'spec_helper'

describe 'GET root path' do
  it 'returns JSON' do
    get '/api'

    expect(last_response.status).to eq(200)
  end
end
