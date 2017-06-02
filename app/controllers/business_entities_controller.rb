class BusinessEntitiesController < ApplicationController
  before_action :set_business_entity, only: [:staff]
  def staff
    render json: @business_entity.staff, status: 200
  end

  private
  def set_business_entity
    @business_entity = BusinessEntity.find params[:id]
  end
end
