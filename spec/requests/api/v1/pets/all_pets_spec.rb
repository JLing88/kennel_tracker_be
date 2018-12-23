require 'rails_helper'

describe 'Pet API Endpoints' do
  context 'GET /api/v1/pets' do
    it 'returns all pets and their owners' do
      owner_1, owner_2 = create_list(:owner, 2)
      pet_1, pet_2, pet_3, pet_4 = create_list(:pet, 4)

      PetOwner.create!(pet: pet_1, owner: owner_1)
      PetOwner.create!(pet: pet_1, owner: owner_2)
      PetOwner.create!(pet: pet_3, owner: owner_2)
      PetOwner.create!(pet: pet_4, owner: owner_2)

      get '/api/v1/pets'

      expect(response).to be_successful

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data][0][:attributes]).to have_key(:name)
      expect(result[:data][0][:attributes]).to have_key(:species)
      expect(result[:data][0][:attributes]).to have_key(:breed)
      expect(result[:data][0][:attributes]).to have_key(:color)
      expect(result[:data][0][:attributes]).to have_key(:dob)
      expect(result[:data][0][:attributes]).to have_key(:spayedNeutered)
      expect(result[:data][0][:attributes]).to have_key(:medications)
      expect(result[:data][0][:attributes]).to have_key(:feedingInstructions)
      expect(result[:data][0][:attributes]).to have_key(:shots)
      expect(result[:data][0][:attributes]).to have_key(:owner)
      expect(result[:data].count).to eq(4)
    end
  end
end