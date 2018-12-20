class Api::V1::VetsController < ApplicationController
  def index
    options = { is_collection: true }
    render json: VetSerializer.new(Vet.all, options).serialized_json, status: 200
  end
end