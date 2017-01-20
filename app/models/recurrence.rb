class Recurrence < ApplicationRecord
  belongs_to :business_entity

  validates :business_entity_id, presence: true
end
