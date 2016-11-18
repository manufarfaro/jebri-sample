class Net::ProductFamiliesController < Net::BaseController
  before_action :set_product_family, only: [:show, :edit, :update, :destroy]

  def index
    @filterrific = initialize_filterrific(
        ProductFamily,
        params[:filterrific],
        select_options: {
            sorted_by: ProductFamily.options_for_sorted_by,
            with_enabled: ProductFamily.options_for_enabled
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @product_families = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/product_families/1
  def show
  end

  # GET /net/product_families/new
  def new
    @product_family = ProductFamily.new
  end

  # GET /net/product_families/1/edit
  def edit
  end

  # POST /net/product_families
  # POST /net/product_families.json
  def create
    @product_family = ProductFamily.new(product_family_params)

    respond_to do |format|
      if @product_family.save
        format.html { redirect_to net_product_family_path(@product_family), notice: 'La familia se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_product_family_path(@product_family) }
      else
        format.html { render new_net_product_family_path, params: :params }
        format.json { render json: @product_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/users/1
  # PATCH/PUT /net/users/1.json
  def update
    respond_to do |format|
      if @product_family.update(product_family_params)
        format.html { redirect_to net_product_family_path(@product_family), notice: 'La familia se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_product_family_path(@product_family) }
      else
        format.html { render :edit }
        format.json { render json: @product_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/users/1
  # DELETE /net/users/1.json
  def destroy
    @product_family.destroy
    respond_to do |format|
      format.html { redirect_to net_product_families_url, notice: 'La familia se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_family
      @product_family = ProductFamily.find(params[:id])
    end
    def product_family_params
      params.require(:product_family).permit(:id, :name, :avatar, :enabled)
    end
end
