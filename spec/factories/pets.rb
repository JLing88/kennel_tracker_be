FactoryBot.define do
  factory :pet do
    sequence(:name)      { |n| "Dog ##{n}" }
    species              { ['Dog', 'Cat'].sample }
    sequence(:breed)     { |n| "Breed ##{n}" }
    color                { ['Brindle', 'Blue', 'Black', 'Tan', 'Orange'].sample }
    dob                  { '2010-10-01' }
    spayed_neutered      { [true, false].sample }
    medications          { 'Insulin twice a day. Diet pills at night.' }
    feeding_instructions { 'Eats seven times a day. 1/2 cup each.' }
    shots                { 'Rabies vaccine: 12/10/19, Bortadella: 02/03/2020' }
  end
end
