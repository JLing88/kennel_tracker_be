class Vet < ApplicationRecord
  has_many :pet_vets
  has_many :pets, through: :pet_vets
end
