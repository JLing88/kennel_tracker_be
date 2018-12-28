class Api::V1::VetsController < ApplicationController
  def index
    options = { is_collection: true }
    render json: VetSerializer.new(Vet.all, options).serialized_json, status: 200
  end

  def create
    vet = Vet.new(vet_params)

    if vet.save
      render json: { 'message': 'Vet created' }, status: 201
    else
      render json: { 'error': vet.errors.full_messages.join(', ') }, status: 400
    end
  end

  private

  def vet_params
    params.require(:vet).permit(:practice_name, :vet_name, :address, :phone, :email)
  end
end