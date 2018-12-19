FactoryBot.define do
  factory :reservation do
    pet      { create(:pet) }
    owner    { create(:owner) }
    run      { create(:run) }
    checkin  { "2018-12-18 14:44:07" }
    checkout { "2018-12-18 14:44:07" }
    grooming { [true, false].sample }
    daycare  { [true, false].sample }
    boarding { [true, false].sample }
  end
end
