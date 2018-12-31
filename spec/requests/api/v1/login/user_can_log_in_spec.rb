require 'rails_helper'

describe 'Login API Endpoint' do
  context 'POST /api/v1/login' do
    it 'returns a jwt after successful login' do
      user = create(:user)

      post "/api/v1/login?auth[email]=#{user.email}&auth[password]=#{user.password}"

      result = JSON.parse(response.body)

      expect(result).to have_key("jwt")
    end
  end
end