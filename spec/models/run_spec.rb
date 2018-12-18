require 'rails_helper'

RSpec.describe Run, type: :model do
  describe 'Relationships' do
    it { should have_many :reservations }
  end
end
