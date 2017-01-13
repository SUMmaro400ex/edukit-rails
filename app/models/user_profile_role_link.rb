class UserProfileRoleLink < ApplicationRecord
  belongs_to :user_profile
  belongs_to :role
end
