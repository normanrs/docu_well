class User < ApplicationRecord
  before_create :create_api_key
  has_many :profiles, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  has_secure_password

  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
