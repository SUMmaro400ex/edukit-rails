class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :business_entity
  has_many :user_profile_role_links, dependent: :destroy
  has_many :roles, through: :user_profile_role_links
  has_many :contracts, dependent: :destroy

end
