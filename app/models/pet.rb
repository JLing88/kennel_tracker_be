class Pet < ApplicationRecord
  has_many :pet_owners
  has_many :owners, through: :pet_owners
  has_many :reservations
  has_many :pet_vets
  has_many :vets, through: :pet_vets
end
