class CreateRecurrences < ActiveRecord::Migration[5.0]
  def change
    create_table :recurrences do |t|

      t.integer :business_entity_id
      t.string :frequency_code
      t.integer :bin_day
      t.integer :interval
      t.string :day_position
      t.integer :month_day
      t.integer :year_month
      t.timestamp :start_at
      t.timestamp :end_at
      t.date :start_date
      t.date :end_date, default: nil
      t.timestamp :updated_at
      t.integer :created_by
      t.integer :updated_by

      t.timestamp
    end
  end
end
