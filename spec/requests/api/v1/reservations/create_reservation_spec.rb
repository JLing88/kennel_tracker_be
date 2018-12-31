require 'rails_helper'

describe 'Reservations API Endpoint' do

  before(:each) do
    user = create(:user)
    @jwt = login_user(user)
  end

  context 'POST /api/v1/reservations' do
    it 'allows user to create a new reservation' do
      pet   = create(:pet)
      owner = create(:owner)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
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

    it 'will not create reservation if owner or pet is invalid' do
      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
      }

      payload = {
        pet_id: 1000,
        owner_id: 1000,
        run_number: 5,
        checkin: '2019-01-07',
        checkout: '2019-01-14',
        grooming: true,
        daycare: false,
        boarding: true
      }

      post '/api/v1/reservations', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq('Pet must exist, Owner must exist')
    end

    it 'will not create reservation if checkout or checkin is missing' do
      pet   = create(:pet)
      owner = create(:owner)

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@jwt}"
      }

      payload = {
        pet_id: pet.id,
        owner_id: owner.id,
        run_number: 5,
        checkin: '',
        checkout: '',
        grooming: true,
        daycare: false,
        boarding: true
      }

      post '/api/v1/reservations', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq('Checkin can\'t be blank, Checkout can\'t be blank')
    end
  end
end
