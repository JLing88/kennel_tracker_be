class Reservation < ApplicationRecord
  validates :checkin, :checkout, presence: true

  belongs_to :pet
  belongs_to :owner
  belongs_to :run
end
