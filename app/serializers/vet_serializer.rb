class VetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :practice_name, :vet_name, :address, :phone, :email
end
