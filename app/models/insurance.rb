class Insurance < ApplicationRecord
  enum insurance_type: [:medical, :dental, :vision, :supplemental]
end
