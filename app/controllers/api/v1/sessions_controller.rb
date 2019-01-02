class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  FOUR_HOURS_LATER = 4*60*60

  def create
    user = User.find_by(email: auth_params[:email])
    if user == nil
      render json: { 'error': 'Invalid credentials' }, status: 400
    else
      user.authenticate(auth_params[:password])
      jwt = Auth.issue({ user: user.id, exp: (Time.current + FOUR_HOURS_LATER).to_i})
      render json: { jwt: jwt, exp: (Time.current + FOUR_HOURS_LATER).to_i }
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
