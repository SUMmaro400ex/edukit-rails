class AddPublicToRights < ActiveRecord::Migration[5.0]
  def change
    add_column :rights, :public, :boolean, default: true
  end
end
