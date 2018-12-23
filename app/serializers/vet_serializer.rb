class VetSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :practice_name, :vet_name, :address, :phone, :email
end
