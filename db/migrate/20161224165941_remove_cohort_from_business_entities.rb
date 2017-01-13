class RemoveCohortFromBusinessEntities < ActiveRecord::Migration[5.0]
  def change
    remove_reference :business_entities, :cohort, foreign_key: true
  end
end
