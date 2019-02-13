class Insurance < ActiveRecord
  enum insurance_type: [:medical, :dental, :vision, :supplemental]
end
