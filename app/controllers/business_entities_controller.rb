class BusinessEntitiesController < ApplicationController
  before_action :set_business_entity, only: [:show]

  def show
    @user = User.new
  end

  private

  def set_business_entity
    @business_entity = BusinessEntity.find(params[:id])
  end
end
