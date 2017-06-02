class Role < ApplicationRecord
  has_many :user_profiles, through: :user_profile_role_links
  has_many :user_profile_role_links
  has_many :right_role_links

  STAFF_ROLES = ['SA', 'TA'].freeze

  def staff?
    STAFF_ROLES.include?(code)
  end
end
