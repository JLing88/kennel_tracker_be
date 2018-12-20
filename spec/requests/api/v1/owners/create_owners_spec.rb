require 'rails_helper'

describe 'Owners API Endpoint' do
  context 'POST /api/v1/owners' do
    it 'allows user to create a new owner' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        first_name: 'First',
        last_name:  'Last',
        address:    '1400 Utah St. Denver CO 80401',
        home_phone: '(720) 300-3000',
        cell_phone: '(720) 300-5000',
        email:      'mikecm@gmail.com'
      }

      post '/api/v1/owners', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq('Owner created')
    end
  end
end
