class Cohort < ApplicationRecord
  has_many :user_profiles
  belongs_to :business_entity
end