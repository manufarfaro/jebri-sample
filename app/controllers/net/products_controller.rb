class Net::ProductsController < Net::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific],
      select_options: {
        sorted_by: Product.options_for_sorted_by,
        with_enabled: Product.options_for_enabled,
        with_product_family: Product.options_for_product_family
      },
      persistence_id: 'shared_key',
      default_filter_params: {}
    ) or return
    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/products/1
  def show
  end

  # GET /net/products/new
  def new
    @product = Product.new
  end

  # GET /net/product/1/edit
  def edit
  end

  # POST /net/products
  # POST /net/products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to net_product_path(@product), notice: 'El producto se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_product_path(@product) }
      else
        format.html { render new_net_product_path, params: :params }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/products/1
  # PATCH/PUT /net/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to net_product_path(@product), notice: 'El producto se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_product_path(@product) }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/products/1
  # DELETE /net/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to net_products_url, notice: 'El producto se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:id, :name, :description, :documentation, :specification, :product_family_id, :product_family, :avatar, :enabled)
  end
end
