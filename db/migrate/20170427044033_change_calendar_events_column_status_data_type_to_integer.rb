class ChangeCalendarEventsColumnStatusDataTypeToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :calendar_events, :status
    add_column :calendar_events, :status, :integer, default: 0
  end
end
