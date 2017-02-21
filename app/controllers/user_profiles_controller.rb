class UserProfilesController < ApplicationController

  def index
    render json: { userProfiles: User.find(params[:user_id]).user_profiles}
  end


end
