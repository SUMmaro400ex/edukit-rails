class BusinessEntitiesController < ApplicationController
  before_action :set_business_entity, only: [:show]
  before_action :set_user_profile, only: [:show]


  def show
    @roles = Role.all
    @user = User.new
  end

  private

  def set_business_entity
    @business_entity = BusinessEntity.find(params[:id])
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:user_profile_id])
  end
end
