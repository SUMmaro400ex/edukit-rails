class BusinessEntity < ApplicationRecord
  has_many :user_profiles
  has_many :cohorts

  def staff
    user_profiles.select(&:is_staff?).map(&:user_vo)
  end
end
