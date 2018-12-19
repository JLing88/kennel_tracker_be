require 'rails_helper'

RSpec.describe Pet, type: :model do
  context "Relationships" do
    it { should have_many :pet_owners }
    it { should have_many(:owners).through(:pet_owners) }
    it { should have_many :reservations }
    it { should have_many :pet_vets}
    it { should have_many(:vets).through(:pet_vets) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:species) }
    it { should validate_presence_of(:breed) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:dob) }
    it { should validate_presence_of(:spayed_neutered) }
  end
end
