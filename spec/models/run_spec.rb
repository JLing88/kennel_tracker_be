require 'rails_helper'

RSpec.describe Run, type: :model do
  describe 'Relationships' do
    it { should have_many :reservations }
  end

  describe 'Validations' do
    it { should validate_presence_of(:run_number)}
  end
end
