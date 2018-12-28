require 'rails_helper'

describe 'Vets API Endpoint' do
  context 'POST /api/v1/vets' do
    it 'allows user to create a new vet' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        practice_name: 'Western Animal Clinic',
        vet_name: 'Dr. Chiarella',
        address: '123 Main St. Wheat Ridge, CO 80033',
        phone: '303-555-1212',
        email: 'wac@gmail.com'
      }

      post '/api/v1/vets', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq("Vet created")
    end

    it 'will not create vet if any required fields are missing' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        practice_name: '',
        vet_name: '',
        address: '123 Main St. Wheat Ridge, CO 80033',
        phone: '303-555-1212',
        email: 'wac@gmail.com'
      }

      post '/api/v1/vets', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq("Practice name can't be blank, Vet name can't be blank")
    end
  end
end