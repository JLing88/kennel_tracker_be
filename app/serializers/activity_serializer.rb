class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  
  attributes :id,
             :trackable_type,
             :trackable_id,
             :key,
             :created_at

  attribute :trackable_id do |activity|
    eval "#{activity.trackable_type}Serializer.new(#{activity.trackable_type}.find_by_id(#{activity.trackable_id}))"
  end

  attribute :owner_id do |activity|
    UserSerializer.new(User.find_by_id(activity.owner_id))
  end
end
