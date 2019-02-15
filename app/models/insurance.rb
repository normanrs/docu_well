class Insurance < ApplicationRecord
  belongs_to :profile
  enum insurance_type: [:medical, :dental, :vision, :supplemental]
end
