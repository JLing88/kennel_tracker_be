require 'rails_helper'

describe 'Owners API Endpoint' do

  before(:each) do
    user = create(:user)
    @jwt = login_user(user)
  end

  context 'GET /api/v1/logs' do
    it 'allows admin to request activity logs' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
      }

      get '/api/v1/logs', headers: headers

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
    end
  end
end
