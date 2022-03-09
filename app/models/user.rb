class User < ApplicationRecord
  validates :email, :presence => true, :uniqueness => true, format: { with: URI::MailTo::EMAIL_REGEXP }  
  validates :password_digest, :presence => true

  has_secure_password

  def generate_api_key
    self.update(api_key: ApiKey.create.access_token)
  end
end
