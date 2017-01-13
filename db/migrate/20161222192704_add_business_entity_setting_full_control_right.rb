class AddBusinessEntitySettingFullControlRight < ActiveRecord::Migration[5.0]
  def up
    Right.create!(
        code: "BESFC",
        short_description: "Business Entity Settings CRUD actions",
        long_description: "Able to create, read, update, and destroy Business Entity Settings",
        title: "Business Entity Settings Full Control"
    )
  end

  def down
    Right.find_by_code("BESFC").destroy!
  end
end
