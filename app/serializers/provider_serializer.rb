class ProviderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :given_name,
             :surname,
             :street_address,
             :city,
             :state,
             :zip,
             :phone
end
