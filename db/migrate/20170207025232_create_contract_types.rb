class CreateContractTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :contract_types do |t|
      t.string :name
      t.string :description
      t.string :code

      t.timestamps
    end
  end
end
