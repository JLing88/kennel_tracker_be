require 'rails_helper'

RSpec.describe Vet, type: :model do
  describe "Relationships" do
    it { should have_many :pet_vets }
    it { should have_many(:pets).through(:pet_vets) }
  end
end
