class PetVetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :pet_id, :vet_id
end
