class BusinessEntitiesController < ApplicationController
  before_action :set_business_entity, only: [:show]
  before_action :set_user_profile, only: [:show]
  before_action :set_roles, only: [:show]


  def show
    @user = User.new
    @cohort = Cohort.new
  end

  private

  def set_roles
    @new_user_roles = Role.where(code: %w(TA SA))
  end

  def set_business_entity
    @business_entity = BusinessEntity.find(params[:id])
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:user_profile_id])
  end
end
