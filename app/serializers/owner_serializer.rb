class OwnerSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :first_name,
             :last_name,
             :address,
             :home_phone,
             :cell_phone,
             :email
end
