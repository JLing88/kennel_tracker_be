require 'rails_helper'

describe 'Reservations API Endpoint' do
  context 'POST /api/v1/reservations' do
    it 'allows user to create a new reservation' do
      pet   = create(:pet)
      owner = create(:owner)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        pet_id: pet.id,
        owner_id: owner.id,
        run_number: 5,
        checkin: '2019-01-07',
        checkout: '2019-01-14',
        grooming: true,
        daycare: false,
        boarding: true
      }

      post '/api/v1/reservations', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq('Reservation created')
    end
  end
end
