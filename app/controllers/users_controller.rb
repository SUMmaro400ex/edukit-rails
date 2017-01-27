class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_user_profiles, only: [:show]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def show
    if @user.user_profiles.length == 1
      redirect_to user_user_profile_path(@user.id, @user.user_profiles.first.id)
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_profiles
    @user_profiles = @user.user_profiles
  end
end
