require 'rails_helper'

describe 'User API Endpoint' do
  context 'POST /api/v1/users' do
    it 'allows admin to create a user' do

      admin = create(:user, email: 'test@test.com', role: 1)
      @admin_jwt = login_user(admin)

      payload = {
        email: 'example@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      headers = {
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Bearer #{@admin_jwt}"
      }
      post '/api/v1/users', headers: headers, params: payload.to_json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:message)
      expect(result[:message]).to eq('User created')
    end

    it 'rejects user creation from non-admin user' do
      user = create(:user, email: 'test@example.com')
      @user_jwt = login_user(user)

      payload = {
        email: 'example@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      headers = {
        "Authorization":"Bearer #{@user_jwt}"
      }

      post '/api/v1/users', headers: headers, params: payload.to_json
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(result).to have_key(:error)
      expect(result[:error]).to eq('')
    end
  end
end