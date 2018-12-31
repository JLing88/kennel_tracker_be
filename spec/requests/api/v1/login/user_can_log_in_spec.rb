require 'rails_helper'

describe 'Login API Endpoint' do
  context 'POST /api/v1/login' do
    it 'returns a jwt after successful login' do
      user = create(:user)
      post "/api/v1/login?auth[email]=#{user.email}&auth[password]=#{user.password}"

      result = JSON.parse(response.body)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(result).to have_key("jwt")
    end

    it 'returns error if login credentials are invalid' do
      post "/api/v1/login?auth[email]=email&auth[password]=password"

      result = JSON.parse(response.body)
      expect(response.status).to eq(400)
      expect(result).to have_key('error')
      expect(result['error']).to eq('Invalid credentials')
    end
  end
end