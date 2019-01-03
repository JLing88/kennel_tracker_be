class Api::V1::ReservationsController < ApplicationController
  before_action :get_reservation, :verify_reservation, only: :update

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      send_confirmation_email(reservation)
      render json: { 'message': 'Reservation created' }, status: 201
    else
      render json: { 'error': reservation.errors.full_messages.join(', ') }, status: 400
    end
  end

  def update
    if reservation.update(reservation_params)
      render json: { "message": "Reservation updated" }, status: 201
    else
      render json: { 'error': reservation.errors.full_messages.join(', ') }, status: 400
    end
  end

  private
  attr_reader :reservation

  def send_confirmation_email(reservation)
    KennelMailer.reservation_confirmation(reservation).deliver_now
  end

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

  def get_reservation
    @reservation ||= Reservation.find_by_id(params[:id])
  end

  def verify_reservation
    render json: { "error": "Reservation with ID #{params[:id]} not found" }, status: 400 if reservation.nil?
  end
end
