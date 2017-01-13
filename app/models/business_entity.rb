class BusinessEntity < ApplicationRecord
  has_many :user_profiles
  has_many :cohorts
end
