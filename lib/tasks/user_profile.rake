namespace :user_profile do

  desc 'Add EduKit User Profile for User'
  task :add_edukit_user_profile_for_user, [:user_id] => [:environment] do |t, args|
    UserProfile.create!(business_entity_id: BusinessEntity.find_by_name("EduKit").id, user_id: args[:user_id])
  end

  desc 'Add site admin role to user profile'
  task :add_site_admin_role, [:user_profile_id] => [:environment] do |t, args|
    UserProfileRoleLink.create!(user_profile_id: args[:user_profile_id], role_id: Role.find_by_code('SA').id)
  end
end