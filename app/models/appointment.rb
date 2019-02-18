class Appointment < ApplicationRecord
  belongs_to :profile
  belongs_to :provider
  has_many :tests


end
