FactoryBot.define do
  factory :reservation do
    pet { nil }
    owner { nil }
    run { nil }
    checkin { "2018-12-18 14:44:07" }
    checkout { "2018-12-18 14:44:07" }
    grooming { false }
    daycare { false }
    boarding { false }
  end
end
