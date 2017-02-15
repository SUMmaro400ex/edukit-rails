class CohortsController < ApplicationController
  before_action :set_user_profile, only: [:create]

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.business_entity_id = @user_profile.business_entity_id
    if @cohort.save
      redirect_to user_profile_business_entity_path(@user_profile.id, @user_profile.business_entity_id)
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :number, :start_date, :end_date, :max_capacity)
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:user_profile_id])
  end
end
