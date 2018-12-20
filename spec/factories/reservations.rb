FactoryBot.define do
  factory :reservation do
    pet        { create(:pet) }
    owner      { create(:owner) }
    run_number { rand(1..50) }
    checkin    { Date.current.beginning_of_day }
    checkout   { Date.current.end_of_day }
    grooming   { [true, false].sample }
    daycare    { [true, false].sample }
    boarding   { [true, false].sample }
  end
end
