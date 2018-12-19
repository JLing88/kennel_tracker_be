FactoryBot.define do
  factory :run do
    sequence(:run_number) { |n| "#{n}" }
  end
end
