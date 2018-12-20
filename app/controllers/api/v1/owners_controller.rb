class Api::V1::OwnersController < ApplicationController
  def create
    owner = Owner.new(owner_params)

    if owner.save
      render json: { "message": "Owner created" }, status: 201
    else
      render json: { "error": owner.errors.full_messages.join(', ') }, status: 400
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :address, :home_phone, :cell_phone, :email)
  end
end
