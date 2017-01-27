class AddStudentRole < ActiveRecord::Migration[5.0]
  def up
    Role.create!(
        code: "ST",
        name: "Student",
        description: "Student"
    )
  end

  def down
    Role.find_by_code("ST").destroy!
  end
end
