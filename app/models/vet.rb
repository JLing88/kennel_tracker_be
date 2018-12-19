class Vet < ApplicationRecord
  validates :practice_name, :vet_name, presence: true

  has_many :pet_vets
  has_many :pets, through: :pet_vets
end
