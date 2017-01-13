class AddTaRole < ActiveRecord::Migration[5.0]
  def up
    Role.create!(
        code: "TA",
        name: "Teaching Assistant",
        description: "Teaching Assistant"
    )
  end

  def down
    Role.find_by_code("TA").destroy!
  end
end
