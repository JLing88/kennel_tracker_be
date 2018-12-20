class Api::V1::Reservations::CurrentController < ApplicationController
  def index
    render json: { "yay": "yay" }, status: 200
  end
end
