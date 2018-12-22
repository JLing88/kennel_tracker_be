class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :run_number,
             :grooming,
             :daycare,
             :boarding

  attribute :owner do |reservation|
    OwnerSerializer.new(reservation.owner)
  end

  attribute :pet do |reservation|
    PetSerializer.new(reservation.pet)
  end
end
