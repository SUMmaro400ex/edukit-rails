namespace :business_entity do
  desc 'Create Edukit Business Entity'
  task create_edukit_be: :environment do
    BusinessEntity.create(name: "EduKit")
  end
end