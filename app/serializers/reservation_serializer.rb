class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :run_number,
             :grooming,
             :daycare,
             :boarding

  attribute :checkin do |reservation|
    reservation.checkin.to_date
  end

  attribute :checkout do |reservation|
    reservation.checkout.to_date
  end

  attribute :owner do |reservation|
    OwnerSerializer.new(reservation.owner)
  end

  attribute :pet do |reservation|
    PetSerializer.new(reservation.pet)
  end
end
