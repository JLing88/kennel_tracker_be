class Api::V1::UsersController < ApplicationController
  before_action :admin?
  def create
    user = User.new(user_params)
    binding.pry
    if user.save
      render json: { 'message': 'User created' }, status: 201
    else
      render json: { 'error': user.errors.full_messages.join(', ') }, status: 400
    end
  end

  private

  attr_accessor :user

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role)
  end
end
