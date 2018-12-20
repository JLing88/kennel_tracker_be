require 'faker'

owners = []
vets   = []
pets   = []

puts "Creating Owners"
10.times do
  owners << Owner.create!(
    first_name: Faker::Name.unique.first_name,
    last_name:  Faker::Name.unique.last_name,
    address:    Faker::Address.unique.full_address,
    home_phone: Faker::PhoneNumber.unique.cell_phone,
    cell_phone: Faker::PhoneNumber.unique.cell_phone,
    email:      Faker::Internet.unique.email
  )
end

puts "Creating Vets"
3.times do
  vets << Vet.create!(
    practice_name: Faker::Company.unique.name,
    vet_name:      "Dr. #{Faker::Name.unique.name}",
    address:       Faker::Address.unique.full_address,
    phone:         Faker::PhoneNumber.unique.cell_phone,
    email:         Faker::Internet.unique.email
  )
end

puts "Creating Pets: Dogs"
20.times do
  pets << Pet.create!(
    name:                 Faker::Dog.unique.name,
    species:              'Dog',
    breed:                Faker::Dog.breed,
    color:                %w[Brindle Brown Black Gray].sample,
    dob:                  Faker::Date.between(8.years.ago, 6.months.ago),
    spayed_neutered:      true,
    medications:          'None',
    feeding_instructions: '3 times a day 1/2 cup',
    shots:                'Rabies: 12/10/2018'
  )
end

puts "Creating Pets: Cats"
10.times do
  pets << Pet.create!(
    name:                 Faker::Cat.unique.name,
    species:              'Cat',
    breed:                Faker::Cat.breed,
    color:                %w[Orange Black White Gray Calico].sample,
    dob:                  Faker::Date.between(8.years.ago, 6.months.ago),
    spayed_neutered:      true,
    medications:          'None',
    feeding_instructions: '2 times a day 1/4 cup',
    shots:                'Rabies: 12/10/2018'
  )
end

puts "Creating Associations: Pets with Vets"
Pet.all.each do |pet|
  pet.vets << vets.sample(rand(1..2))
end

pet_slices = pets.shuffle.each_slice(3).to_a

puts "Creating Associations: Owners with Pets"
Owner.all.each_with_index do |owner, i|
  owner.pets << pet_slices[i]
end

runs = (1..50).to_a

puts "Creating Reservations"
15.times do
  Reservation.create!(
    pet:   pets.shuffle.pop,
    owner: owners.sample,
    run_number: runs.delete_at(rand(0..runs.length - 1)),
    checkin: Faker::Time.between(4.days.ago, Time.current),
    checkout: Faker::Time.between(Time.current, 2.days.from_now),
    grooming: [true, false].sample,
    daycare: [true, false].sample,
    boarding: [true, false].sample
  )
end
