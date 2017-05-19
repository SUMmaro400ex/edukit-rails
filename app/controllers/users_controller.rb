class UsersController < ApplicationController

  def create
    User.build_from_args(args)
    render json: true, status: 200
  end

private

  def set_user_profile
    @user_profile = UserProfile.find(params[:user_profile_id])
  end

end
