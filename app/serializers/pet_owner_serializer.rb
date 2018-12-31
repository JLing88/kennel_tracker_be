class PetOwnerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :owner_id, :pet_id
end
