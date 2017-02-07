class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :user_profile, foreign_key: true
      t.belongs_to :contract_type, foreign_key: true
      t.integer :rate

      t.timestamps
    end
  end
end
