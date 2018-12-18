require 'rails_helper'

RSpec.describe PetOwner, type: :model do
  describe "Relationships" do
    it { should belong_to :pet }
    it { should belong_to :owner }
  end
end
