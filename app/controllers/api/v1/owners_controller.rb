class Api::V1::OwnersController < ApplicationController
  def create
    owner = Owner.new(owner_params)
    owner.save

    render json: { "message": "Owner created" }, status: 201
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :address, :home_phone, :cell_phone, :email)
  end
end
