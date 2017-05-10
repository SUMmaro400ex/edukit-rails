class UserProfilesController < ApplicationController

  def index
    render json: { userProfiles: User.find(params[:user_id]).user_profiles}, status: 200
  end

end
