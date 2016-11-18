class Api::OfficesController < Api::BaseController
  before_action :set_office, only: [:show]
  def index
    @offices = Office.enabled.where(nil)
    @offices = @offices.where(commerce: params[:commerce_id]) if params[:commerce_id].present?
    @offices = @offices.where(is_sales: params[:is_sales]) if params[:is_sales].present?
    @offices = @offices.where(is_technical_support: params[:is_technical_support]) if params[:is_technical_support].present?
    @offices = @offices.where(city_id: params[:city_id]) if params[:city_id].present?
  end
  def show
  end
  private
  def set_office
    @office = Office.enabled.find(params[:id])
  end
end