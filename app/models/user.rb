class User < ApplicationRecord
  has_many :user_profiles
  has_secure_password

  def self.build_from_args(args)
    staff_args = args['staff']
    user = new(first_name: staff_args['firstName'],
               last_name: staff_args['lastName'],
               email: staff_args['email'],
               password: staff_args['password'],
               password_confirmation: staff_args['passwordConfirmation'])
    if user.save
      user_profile = UserProfile.new(user_id: user.id, business_entity_id: args['businessEntityId'])
      if user_profile.save
        UserProfileRoleLink.new(user_profile_id: user_profile.id, role_id: Role.find_by_code(staff_args['type']).id).save
      end
      if staff_args['type'] == 'TA'
        Contract.create(contract_type_id: ContractType.find_by_code('CR').id, user_profile_id: user_profile.id, rate: staff_args['hourly'].gsub('.', '').to_i)
      end
    end
  end

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
