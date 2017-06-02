class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :business_entity
  has_many :user_profile_role_links, dependent: :destroy
  has_many :roles, through: :user_profile_role_links
  has_many :contracts, dependent: :destroy

  def is_staff?
    roles.any?(&:staff?)
  end

  def user_vo
    user.to_vo
  end

  def with_roles
    attributes.merge(roles: roles)
  end
end
