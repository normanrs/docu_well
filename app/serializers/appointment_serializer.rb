class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :datetime,
             :provider_id,
             :profile_id
end
