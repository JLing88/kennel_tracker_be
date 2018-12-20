class Api::V1::Reservations::CurrentController < ApplicationController
  def index
    options = { is_collection: true }
    render json: ReservationSerializer.new(Reservation.current, options).serialized_json, status: 200
  end
end
