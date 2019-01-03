class Reservation < ApplicationRecord
  validates :checkin, :checkout, presence: true

  belongs_to :pet
  belongs_to :owner

  scope :current, -> { 
    where(':date BETWEEN checkin AND checkout', date: Date.current)
      .includes(%i[owner pet])
  }

  def services
    services_arr = []
    services_arr << 'Grooming' if self.grooming
    services_arr << 'Daycare' if self.daycare
    services_arr << 'Boarding' if self.boarding
    services_arr.join(', ')
  end
end
