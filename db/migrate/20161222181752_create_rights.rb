class CreateRights < ActiveRecord::Migration[5.0]
  def change
    create_table :rights do |t|
      t.string :code
      t.string :short_description
      t.text :long_description
      t.string :title

      t.timestamps
    end
  end
end
