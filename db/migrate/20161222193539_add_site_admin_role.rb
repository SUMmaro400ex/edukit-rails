class AddSiteAdminRole < ActiveRecord::Migration[5.0]
  def up
    Role.create!(
        code: "SA",
        name: "Site Admin",
        description: "Site Administrator"
    )
  end

  def down
    Role.find_by_code("SA").destroy!
  end
end
