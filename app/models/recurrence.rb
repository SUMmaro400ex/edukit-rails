class Recurrence < ApplicationRecord
  belongs_to :business_entity
  has_many :calendar_events

  validates :business_entity_id, presence: true

end
