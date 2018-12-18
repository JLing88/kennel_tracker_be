class Reservation < ApplicationRecord
  belongs_to :pet
  belongs_to :owner
  belongs_to :run
end
