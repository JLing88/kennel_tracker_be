class Api::V1::VetsController < ApplicationController
  before_action :get_vet, :verify_vet, only: :update

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

  def update
    vet.update(vet_params)
    render json: { "message": "Vet updated" }, status: 201
  end

  private
  attr_reader :vet

  def get_vet
    @vet ||= Vet.find_by_id(params[:id])
  end

  def verify_vet
    render json: { "error": "Vet with ID #{params[:id]} not found" }, status: 400 if vet.nil?
  end

  def vet_params
    params.require(:vet).permit(:practice_name, :vet_name, :address, :phone, :email)
  end
end