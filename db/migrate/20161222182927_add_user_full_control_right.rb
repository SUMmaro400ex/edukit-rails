class AddUserFullControlRight < ActiveRecord::Migration[5.0]
  def up
    Right.create!(
         code: "UFC",
         short_description: "User CRUD actions",
         long_description: "Able to create, read, update, and destroy users",
         title: "Users Full Control"
    )
  end

  def down
    Right.find_by_code("UFC").destroy!
  end
end
