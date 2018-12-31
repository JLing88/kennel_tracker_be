require 'rails_helper'

describe 'Pets API Endpoint' do

  before(:each) do
    user = create(:user)
    @jwt = login_user(user)
  end

  context 'POST /api/v1/pets' do
    it 'allows a user to create new pet' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
      }

      payload = {
        name: 'Pickle',
        species: 'Dog',
        breed: 'Labrador',
        color: 'black',
        dob: '6-12-2016',
        spayed_neutered: true,
        medications: '',
        feeding_instructions: '1 cup food morning, 1 cup food evening',
        shots: ''
      }

      post '/api/v1/pets', headers: headers, params: payload.to_json

      expect(response).to be_successful

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq('Pet created')
    end

    it 'will not create a pet if any required fields are missing' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
      }

      payload = {
        name: 'Pickle',
        species: 'Dog',
        breed: 'Labrador',
        color: 'black',
        dob: '',
        spayed_neutered: ''
      }

      post '/api/v1/pets', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq("Dob can't be blank, Spayed neutered can't be blank")
    end
  end
end
