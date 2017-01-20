class UserProfileCohortLink < ApplicationRecord
  belongs_to :user_profile
  belongs_to :cohort
end
