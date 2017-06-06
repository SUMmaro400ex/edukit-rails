class SessionsController < ApplicationController
  skip_before_action :require_login!, only: [:create, :destroy]

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: { auth_token: user.generate_auth_token, user: user, user_profiles: user.user_profiles}, status: 200
    else
      invalid_login_attempt
    end

  end

  def front_load_session_data
    response = {}
    user_profile = UserProfile.find params[:user_profile_id]
    response[:business_entity] = user_profile.business_entity
    response[:user_profile_id] = params[:user_profile_id]
    response[:roles] = Role.all
    response[:rights] = Right.all
    response[:right_role_links] = RightRoleLink.all
    render json: response, status: 200
  end

  def destroy
    current_user.invalidate_auth_token if current_user
    head :ok
  end

  private
  def invalid_login_attempt
    render json: { errors: [ { detail:'Error with your login or password' }]}, status: 401
  end

end
