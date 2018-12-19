FactoryBot.define do
  factory :vet do
    sequence(:practice_name) { |n| "Practice Name #{n}" }
    sequence(:vet_name)      { |n| "Vet Name #{n}" }
    address                  { '1600 N. Pennsylvania Ave, Washington, DC 01023 '}
    phone                    { '(303) 922-1022 '}
    email                    { 'email@email.org' }
  end
end
