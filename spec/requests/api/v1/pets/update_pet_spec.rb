require 'rails_helper'

describe "Pet API endpoint" do
  context "PATCH /api/v1/pets" do
    it 'allows user to update an existing pet' do
      pet = create(:pet)

      headers = {
        "Content-Type":"application/json",
        "Accept":"applicaton/json"
      }

      payload = {
        id: "#{pet.id}",
        name: "Toby",
        color: "white"
      }

      patch '/api/v1/pets', headers: headers, params: payload.to_json


      result = JSON.parse(response.body, symbolize_names: true)
      updated_pet = Pet.find_by_id(pet.id)

      expect(updated_pet.name).to eq("Toby")
      expect(updated_pet.color).to eq("white")
      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq("Pet updated")
    end

    it 'will not update if pet ID is invalid' do
      pet = create(:pet)

      headers = {
        "Content-Type":"application/json",
        "Accept":"applicaton/json"
      }

      payload = {
        id: 400,
        name: "Toby",
        color: "white"
      }

      patch '/api/v1/pets', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq("Pet with ID 400 not found")
    end
  end
end