class Api::V1::PetsController < ApplicationController
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

  private

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
end