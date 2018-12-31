require 'rails_helper'

describe "Vet API endpoint" do
  before(:each) do
    user = create(:user)
    @jwt = login_user(user)
  end
  context "PATCH /api/v1/vets" do
    it 'allows user to update an existing vet' do
      vet = create(:vet)

      headers = {
        "Content-Type":"application/json",
        "Accept":"applicaton/json",
        "Authorization":"Bearer #{@jwt}"
      }

      payload = {
        id: "#{vet.id}",
        practice_name: 'Western Animal Clinic',
        vet_name: "Dr. Chiarella"
      }

      patch '/api/v1/vets', headers: headers, params: payload.to_json


      result = JSON.parse(response.body, symbolize_names: true)
      updated_vet = Vet.find_by_id(vet.id)

      expect(updated_vet.practice_name).to eq('Western Animal Clinic')
      expect(updated_vet.vet_name).to eq('Dr. Chiarella')
      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq("Vet updated")
    end

    it 'will not update if pet ID is invalid' do
      pet = create(:pet)

      headers = {
        "Content-Type":"application/json",
        "Accept":"applicaton/json",
        "Authorization":"Bearer #{@jwt}"
      }

      payload = {
        id: 400,
        practice_name: "PetCo",
        vet_name: "Dr. Suess"
      }

      patch '/api/v1/vets', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq("Vet with ID 400 not found")
    end
  end
end