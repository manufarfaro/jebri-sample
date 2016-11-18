class Api::CommercesController < Api::BaseController
  before_action :set_commerce, only: [:show]
  def index
      @commerces = Commerce.enabled.all
  end
  def show
  end
  private
  def set_commerce
    @commerce = Commerce.enabled.find(params[:id])
  end
end