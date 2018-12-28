require 'rails_helper'

describe 'Owners API Endpoint' do
  context 'PATCH /api/v1/owners' do
    it 'allows user to update an owner' do
      owner = create(:owner)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        id: owner.id,
        first_name: 'Steven'
      }

      patch '/api/v1/owners', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq('Owner updated')
    end

    it 'will not update an owner ID is invalid' do
      owner = create(:owner)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        id: 1000,
        first_name: 'Steven'
      }

      patch '/api/v1/owners', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq("Owner with ID 1000 not found")
    end
  end
end
