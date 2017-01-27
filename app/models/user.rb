class User < ApplicationRecord
  has_many :user_profiles
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
