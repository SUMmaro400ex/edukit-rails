class SessionsController < ApplicationController
  skip_before_action :require_login!, only: [:create]

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: { auth_token: user.generate_auth_token, user: user, user_profiles: user.user_profiles}
    else
      invalid_login_attempt
    end

  end

  def destroy
    current_user.invalidate_auth_token
    head :ok
  end

  private
  def invalid_login_attempt
    render json: { errors: [ { detail:'Error with your login or password' }]}, status: 401
  end

end
