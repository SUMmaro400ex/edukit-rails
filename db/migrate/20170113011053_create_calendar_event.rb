class CreateCalendarEvent < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_events do |t|

      t.string :name
      t.string :description
      t.integer :business_entity_id
      t.integer :cohort_id
      t.integer :event_type_id
      t.string :status
      t.date :updated_by
      t.string :created_by
      t.timestamp :updated_at
      t.timestamp

    end
  end
end
