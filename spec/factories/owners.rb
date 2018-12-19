FactoryBot.define do
  factory :owner do
    sequence(:first_name) { |n| "First Name ##{n}" }
    sequence(:last_name)  { |n| "Last Name ##{n}" }
    sequence(:address)    { |n| "Address ##{n}" }
    home_phone            { "(555) 553-3022" }
    cell_phone            { "(555) 503-1011" }
    sequence(:email)      { |n| "email#{n}@email.com" }
  end
end
