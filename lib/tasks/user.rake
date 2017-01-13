namespace :user_profile do
  desc "Add site admin role to user profile"
  task :add_site_admin_role, :id do |t, args|
    UserProfileRoleLink.create!(user_profile_id: args.id, role_id: Role.find_by_code("SA").id)
  end
end