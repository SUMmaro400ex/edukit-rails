class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show]

  def index
    render json: { userProfiles: User.find(params[:user_id]).user_profiles}
  end

  def show
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end
end
