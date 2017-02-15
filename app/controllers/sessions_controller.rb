class SessionsController < ApplicationController
  skip_before_action :require_login!, only: [:create]

  def new

  end

  def create
    user_params = params[:user_login]
    byebug
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: { auth_token: user.generate_auth_token }
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
