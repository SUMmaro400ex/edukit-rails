class CreateCalendarEventResourceLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_event_resource_links do |t|

      t.integer :calender_event_id
      t.integer :resouce_id
      t.timestamps
    end
  end
end
