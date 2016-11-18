class Api::CitiesController < Api::BaseController
  before_action :set_city, only: [:show]
  def index
    @cities = City.with_offices.enabled.where(state: params[:state_id])
    @cities = @cities.where(offices: { is_sales: true }) if params[:is_sales].present?
    @cities = @cities.where(offices: { is_technical_support: true }) if params[:is_technical_support].present?
  end
  def show
  end
  private
    def set_city
      @city = City.enabled.find(params[:id])
    end
end