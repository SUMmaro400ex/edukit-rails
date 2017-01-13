class AddSiteAdminRoleRightLink < ActiveRecord::Migration[5.0]
  def up
    RightRoleLink.create!(
        role_id: Role.find_by_code("SA").id,
        right_id: Right.find_by_code("SAFC").id
    )
  end

  def down
    RightRoleLink.where(role_id: Role.find_by_code("SA").id, right_id: Right.find_by_code("SAFC").id).first.destroy!
  end
end
