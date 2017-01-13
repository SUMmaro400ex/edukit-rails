class CreateUserProfileRoleLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profile_role_links do |t|
      t.belongs_to :user_profile, foreign_key: true
      t.belongs_to :role, foreign_key: true

      t.timestamps
    end
  end
end
