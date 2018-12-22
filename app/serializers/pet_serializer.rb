class PetSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :name,
             :species,
             :breed,
             :color,
             :dob,
             :spayed_neutered,
             :medications,
             :feeding_instructions,
             :shots
end
