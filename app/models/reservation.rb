class Reservation < ApplicationRecord
  validates :checkin, :checkout, presence: true

  belongs_to :pet
  belongs_to :owner

  scope :current, -> { where(checkin: Time.current.all_day).where(checkout: Time.current.all_day) }
end
