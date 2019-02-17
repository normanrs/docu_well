class InsuranceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :insurance_type,
             :carrier,
             :id_number,
             :group_number,
             :phone_number,
             :profile_id
end
