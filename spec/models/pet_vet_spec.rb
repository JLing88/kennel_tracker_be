require 'rails_helper'

RSpec.describe PetVet, type: :model do
  describe 'Relationships' do
    it { should belong_to :pet }
    it { should belong_to :vet }
  end
end
