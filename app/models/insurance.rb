class Insurance < ApplicationRecord
  belongs_to :profile
  validates_presence_of :carrier, :id_number, on: :create

  enum insurance_type: [:medical, :dental, :vision, :supplemental]
end
