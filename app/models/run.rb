class Run < ApplicationRecord
  validates :run_number, presence: true

  has_many :reservations, dependent: :destroy
end
