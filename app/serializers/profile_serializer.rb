class ProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :given_name,
             :surname,
             :dob,
             :height,
             :weight,
             :bp_systolic,
             :bp_diastolic,
             :heart_rate,
             :blood_type,
             :provider_id
end
