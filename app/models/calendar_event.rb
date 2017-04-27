class CalendarEvent < ApplicationRecord
  include RecurrenceCore

  belongs_to :business_entity
  belongs_to :cohort
  belongs_to :event_type
  has_many :calendar_event_resource_links

  validates :business_entity, :presence => true
  validates :event_type, :presence => true

  enum status: {active: 0, inactive: 1}

end
