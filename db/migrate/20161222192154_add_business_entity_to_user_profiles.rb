class AddBusinessEntityToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_profiles, :business_entity, foreign_key: true
  end
end
