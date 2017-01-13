class AddCourseFullControlRight < ActiveRecord::Migration[5.0]
  def up
    Right.create!(
        code: "CFC",
        short_description: "Course CRUD actions",
        long_description: "Able to create, read, update, and destroy courses",
        title: "Courses Full Control"
    )
  end

  def down
    Right.find_by_code("CFC").destroy!
  end
end
