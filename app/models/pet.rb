class Pet < ApplicationRecord
  validates :name, :species, :breed, :color, :dob, :spayed_neutered, presence: true

  has_many :pet_owners, dependent: :destroy
  has_many :owners, through: :pet_owners
  has_many :reservations, dependent: :destroy
  has_many :pet_vets, dependent: :destroy
  has_many :vets, through: :pet_vets
end
