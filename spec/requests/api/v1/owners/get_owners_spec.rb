require 'rails_helper'

describe 'Owner API Endpoints' do

  before(:each) do
    user = create(:user)
    @jwt = login_user(user)
  end

  context 'GET /api/v1/owners' do
    it 'returns a collection of all owners' do
      owner1, owner2 = create_list(:owner, 2)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
      }

      get '/api/v1/owners', headers: headers

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(result).to be_a(Hash)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a(Array)
      expect(result[:data][0]).to have_key(:id)
      expect(result[:data][0]).to have_key(:type)
      expect(result[:data][0]).to have_key(:attributes)
      expect(result[:data][0][:attributes]).to have_key(:firstName)
      expect(result[:data][0][:attributes]).to have_key(:lastName)
      expect(result[:data][0][:attributes]).to have_key(:address)
      expect(result[:data][0][:attributes]).to have_key(:homePhone)
      expect(result[:data][0][:attributes]).to have_key(:cellPhone)
      expect(result[:data][0][:attributes]).to have_key(:email)
    end
  end
end
