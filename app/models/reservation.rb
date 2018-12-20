class Reservation < ApplicationRecord
  validates :checkin, :checkout, presence: true

  belongs_to :pet
  belongs_to :owner

  scope :current, -> { where(':date BETWEEN checkin AND checkout', date: Date.current) }
end
