class CreateRightRoleLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :right_role_links do |t|
      t.belongs_to :right, foreign_key: true
      t.belongs_to :role, foreign_key: true

      t.timestamps
    end
  end
end
