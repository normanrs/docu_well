class Insurance < ApplicationRecord
  belongs_to :profile
  validates_presence_of :carrier, :id_number, on: :create
  validates_uniqueness_of :id_number, on: :create

  enum insurance_type: [:medical, :dental, :vision, :supplemental]
end
