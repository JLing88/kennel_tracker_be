require 'rails_helper'

describe "Pet API endpoint" do
  context "PATCH /api/v1/pets" do
    it 'allows user to update an existing pet' do
      pet = Pet.create!(name: "Fluffy",
                        species: 'Dog',
                        breed: "Lab",
                        color: "black",
                        dob: '12-6-2017',
                        spayed_neutered: true)

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
    end
  end
end