class Contract < ApplicationRecord
  belongs_to :user_profile
  belongs_to :contract_type
end
