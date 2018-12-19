require 'rails_helper'

describe 'Runs API' do
  context 'GET /api/v1/reservations/current' do
    it 'returns a list of active reservations' do
      reservation1, reservation2, reservation3,
        reservation4, reservation5 = create_list(:reservation, 5)

      get '/api/v1/reservations/current'
      active_resos = JSON.parse(response.body)

      expect(response).to be_successful
      expect(active_resos.count).to eq(5)
    end
  end
end
