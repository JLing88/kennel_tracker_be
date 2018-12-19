require 'rails_helper'

RSpec.describe Owner, type: :model do
  context 'Relationships' do
    it { should have_many(:pet_owners) }
    it { should have_many(:pets).through(:pet_owners) }
  end

  context 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:home_phone) }
  end
end