require 'rails_helper'

RSpec.describe Owner, type: :model do
  context 'Relationships' do
    it { should have_many(:pet_owners) }
    it { should have_many(:pets).through(:pet_owners) }
  end

  context 'Validations' do
  end
end