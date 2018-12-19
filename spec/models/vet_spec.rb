require 'rails_helper'

RSpec.describe Vet, type: :model do
  describe "Relationships" do
    it { should have_many :pet_vets }
    it { should have_many(:pets).through(:pet_vets) }
  end

  describe "Validations" do
    it { should validate_presence_of(:practice_name)}
    it { should validate_presence_of(:vet_name)}
  end
end
