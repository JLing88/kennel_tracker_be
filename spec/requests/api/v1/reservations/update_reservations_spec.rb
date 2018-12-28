require 'rails_helper'

describe 'Reservations API Endpoint' do
  context 'PATCH /api/v1/reservations' do
    it 'allows user to update a reservation' do
      reservation = create(:reservation)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        id: reservation.id,
        run_number: 5,
        checkin: '2019-01-07',
        checkout: '2019-01-14',
        grooming: false
      }

      patch '/api/v1/reservations', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq('Reservation updated')
    end

    it 'will not update reservation if owner or pet is invalid' do
      reservation = create(:reservation)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        id: reservation.id,
        pet_id: 1000,
        owner_id: 1000,
        run_number: 5,
        checkin: '2019-01-07',
        checkout: '2019-01-14',
        grooming: false
      }

      patch '/api/v1/reservations', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq('Pet must exist, Owner must exist')
    end

    it 'will not update a reservation if reservation ID is invalid' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json"
      }

      payload = {
        id: 1000,
        pet_id: 1,
        owner_id: 1,
        run_number: 5,
        checkin: '2019-01-07',
        checkout: '2019-01-14',
        grooming: false
      }

      patch '/api/v1/reservations', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq('Reservation with ID 1000 not found')
    end
  end
end
