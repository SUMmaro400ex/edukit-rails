class RemoveCohortFromUserProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_profiles, :cohort_id
  end
end
