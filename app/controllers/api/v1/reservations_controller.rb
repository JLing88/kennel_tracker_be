class Api::V1::ReservationsController < ApplicationController
  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: { 'message': 'Reservation created' }, status: 201
    else
      render json: { 'error': reservation.errors.full_messages.join(', ') }, status: 400
    end
  end

  private

  def reservation_params
    params
      .require(:reservation)
      .permit(
        :pet_id,
        :owner_id,
        :run_number,
        :checkin,
        :checkout,
        :grooming,
        :daycare,
        :boarding
      )
  end
end
