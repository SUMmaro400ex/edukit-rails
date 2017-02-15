class User < ApplicationRecord
  has_many :user_profiles
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_one_profile?
    user_profiles.length == 1
  end

  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(auth_token: token)
    token
  end

  def invalidate_auth_token
    self.update_columns(auth_token: nil)
  end
  
end
