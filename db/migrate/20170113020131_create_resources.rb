class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.string :status
      t.integer :business_entity_id
      t.integer :resource_id
      t.timestamp :updated_at
      t.integer :created_by
      t.integer :updated_by
    end
  end
end
