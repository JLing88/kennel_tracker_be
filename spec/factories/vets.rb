FactoryBot.define do
  factory :vet do
    practice_name { 'Practice Name' }
    vet_name      { 'Vet Name' }
    address       { '1600 N. Pennsylvania Ave, Washington, DC 01023 '}
    phone         { '(303) 922-1022 '}
    email         { 'email@email.org' }
  end
end
