class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  ONE_WEEK_LATER = 604800

  def create
    user = User.find_by(email: auth_params[:email])
    if user == nil
      render json: { 'error': 'Invalid credentials' }, status: 400
    else
      user.authenticate(auth_params[:password])
      jwt = Auth.issue({ user: user.id, exp: (Time.current + ONE_WEEK_LATER).to_i})
      render json: { jwt: jwt, exp: (Time.current + ONE_WEEK_LATER).to_i }
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
