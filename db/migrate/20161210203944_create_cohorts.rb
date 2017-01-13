class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.integer :max_capacity
      t.integer :number

      t.timestamps
    end
  end
end
