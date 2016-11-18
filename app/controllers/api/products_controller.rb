class Api::ProductsController < Api::BaseController
  def index
      @products = Product.enabled.all
  end
  def show_models_by_id
    @models = Model.enabled.where(product: params[:id])
  end
end
