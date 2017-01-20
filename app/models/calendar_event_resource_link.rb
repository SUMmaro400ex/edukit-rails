class CalendarEventResourceLink < ApplicationRecord
  belongs_to :resources
  belongs_to :calendar_events

  validates :resource_id, presence: true
  validates :calender_event_id, presence: true
end
