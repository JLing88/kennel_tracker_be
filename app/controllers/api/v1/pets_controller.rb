class Api::V1::PetsController < ApplicationController
  before_action :get_pet, :verify_pet, only: :update

  def index
    render json: PetSerializer.new(Pet.all)
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      render json: { 'message': 'Pet created'}, status: 201
    else
      render json: { 'error': pet.errors.full_messages.join(', ') }, status: 400
    end
  end

  def update
    pet.update(pet_params)
    render json: { "message": "Pet updated" }, status: 201
  end

  private

  attr_reader :pet

  def pet_params
    params.require(:pet).permit(
                                :name,
                                :species,
                                :breed,
                                :color,
                                :dob,
                                :spayed_neutered,
                                :medications,
                                :feeding_instructions,
                                :shots
                                )
  end

  def get_pet
    @pet ||= Pet.find_by_id(params[:id])
  end

  def verify_pet
    render json: { "error": "Pet with ID #{params[:id]} not found" }, status: 400 if pet.nil?
  end
end
