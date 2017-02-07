class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_user_profiles, only: [:show]
  before_action :set_user_profile, only: [:create]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      role_hash = params[:role]
      user_profile = UserProfile.new(user_id: user.id, business_entity_id: @user_profile.business_entity_id)
      if user_profile.save
        UserProfileRoleLink.new(user_profile_id: user_profile.id, role_id: Role.find_by_code(role_hash[:code]).id).save
      end
    end
    redirect_to user_profile_business_entity_path(@user_profile.id, @user_profile.business_entity_id)
  end

  def show
    redirect_to user_profile_path(@user.user_profiles.first.id) if @user.has_one_profile?
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:user_profile_id])
  end

  def set_user_profiles
    @user_profiles = @user.user_profiles
  end
end
