class User < ApplicationRecord
  validates :email, :presence => true, :uniqueness => true
  validates :password_digest, :presence => true

  has_secure_password

  def generate_api_key
    self.api_key = ApiKey.create.access_token
  end
end
