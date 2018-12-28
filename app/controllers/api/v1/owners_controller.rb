class Api::V1::OwnersController < ApplicationController
  before_action :get_owner, :verify_owner, only: :update

  def index
    render json: OwnerSerializer.new(Owner.all).serialized_json, status: 200
  end

  def create
    owner = Owner.new(owner_params)

    if owner.save
      render json: { "message": "Owner created" }, status: 201
    else
      render json: { "error": owner.errors.full_messages.join(', ') }, status: 400
    end
  end

  def update
    owner.update(owner_params)
    render json: { "message": "Owner updated" }, status: 201
  end

  private
  attr_reader :owner

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :address, :home_phone, :cell_phone, :email)
  end

  def get_owner
    @owner ||= Owner.find_by_id(params[:id])
  end

  def verify_owner
    render json: { "error": "Owner with ID #{params[:id]} not found" }, status: 400 if owner.nil?
  end
end
