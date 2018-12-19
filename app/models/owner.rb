class Owner < ApplicationRecord
  validates :first_name, :last_name, :address, :home_phone, presence: true

  has_many :pet_owners, dependent: :destroy
  has_many :pets, through: :pet_owners
end