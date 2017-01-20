namespace :user do
  desc 'Create System Admin User'
  task create_system_admin_user: :environment do
    user = User.new(first_name: 'System', last_name: 'Admin', email: 'edukit@edukit.com', password: 'password', password_confirmation: 'password')
    user.save!
  end
end