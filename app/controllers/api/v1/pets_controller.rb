class Api::V1::PetsController < ApplicationController
  def index
    render json: PetSerializer.new(Pet.all)
  end
end