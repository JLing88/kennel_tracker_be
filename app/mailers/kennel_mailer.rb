class KennelMailer < ApplicationMailer

  default from: "no_reply@kennel.com"
  def reservation_confirmation(reservation)
    @reservation = reservation
    @owner = reservation.owner
    @pet = reservation.pet

    mail to: "#{@owner.email}", subject: "Reservation Confirmation #{@reservation.checkin.to_date}"
  end
end
