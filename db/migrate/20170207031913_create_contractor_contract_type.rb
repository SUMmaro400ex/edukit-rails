class CreateContractorContractType < ActiveRecord::Migration[5.0]
  def up
    ContractType.create(name: 'Contractor', description: 'Contractor / 1099 Part Time Employee', code: 'CR')
  end

  def down
    ContractType.find_by_code('CR').destroy!
  end
end
