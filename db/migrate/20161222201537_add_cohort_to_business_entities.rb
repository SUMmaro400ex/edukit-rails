class AddCohortToBusinessEntities < ActiveRecord::Migration[5.0]
  def change
    add_reference :business_entities, :cohort, foreign_key: true
  end
end
