require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Relationships' do
    it { should belong_to :pet }
    it { should belong_to :owner }
   it { should belong_to :run }
  end

  describe 'Validations' do
    it { should validate_presence_of(:checkin) }
    it { should validate_presence_of(:checkout) }
  end
end
