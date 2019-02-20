class PrescriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
             :date,
             :dose,
             :directions,
             :refill,
             :provider
end
