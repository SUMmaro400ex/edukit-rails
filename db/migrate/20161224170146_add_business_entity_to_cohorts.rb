class AddBusinessEntityToCohorts < ActiveRecord::Migration[5.0]
  def change
    add_reference :cohorts, :business_entity, foreign_key: true
  end
end
