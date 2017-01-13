class AddBusinessEntityFullControlRight < ActiveRecord::Migration[5.0]
  def up
    Right.create!(
        code: "BEFC",
        short_description: "Business Entities CRUD actions",
        long_description: "Able to create, read, update, and destroy Business Entities",
        title: "Business Entities Full Control"
    )
  end

  def down
    Right.find_by_code("BEFC").destroy!
  end
end
