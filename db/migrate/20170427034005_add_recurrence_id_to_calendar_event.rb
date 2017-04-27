class AddRecurrenceIdToCalendarEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :calendar_events, :recurrences, foreign_key: true
  end
end
