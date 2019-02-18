class Appointment < ApplicationRecord
  belongs_to :profile
  belongs_to :provider
  has_many :tests
  validates_presence_of :datetime, :provider_id, on: :create

end
