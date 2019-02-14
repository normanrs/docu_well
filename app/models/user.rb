class User < ApplicationRecord
  has_secure_password
  before_create :create_api_key


  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
