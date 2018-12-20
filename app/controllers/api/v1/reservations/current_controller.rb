class Api::V1::Reservations::CurrentController < ApplicationController
  def index
    render json: Reservation.current, status: 200
  end
end
