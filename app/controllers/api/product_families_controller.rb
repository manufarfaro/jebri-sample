class Api::ProductFamiliesController < Api::BaseController
  def index
    @product_families = ProductFamily.enabled.all
  end

  def show_products_by_family_id
    @products = Product.enabled.where(product_family: params[:id])
  end
end
