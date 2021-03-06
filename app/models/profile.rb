class Profile < ApplicationRecord
  belongs_to :user
  has_many :insurances, :dependent => :destroy
  has_many :appointments, :dependent => :destroy
  validates_presence_of :given_name, :surname, :dob, on: :create

  enum blood_type: [:o_negative, :o_positive, :a_negative, :a_positive, :b_negative, :b_positive, :ab_negative, :ab_positive]

  def provider
    Provider.find(self.provider_id)
  end

  def insurances
    Insurance.where(profile_id: self.id)
  end

end
