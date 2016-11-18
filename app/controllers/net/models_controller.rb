class Net::ModelsController < Net::BaseController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:index, :new, :edit, :destroy]

  def index
    @filterrific = initialize_filterrific(
      Model.where(product_id: params[:product_id]),
      params[:filterrific],
      select_options: {
        sorted_by: Model.options_for_sorted_by,
        with_enabled: Model.options_for_enabled
      },
      persistence_id: 'shared_key',
      default_filter_params: {}
    ) or return
    @models = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/products/1/models/1
  def show
  end

  # GET /net/products/1/models/new
  def new
    @model = Model.new
  end

  # GET /net/product/1/models/1/edit
  def edit
  end

  # POST /net/products/1/models
  # POST /net/products/1/models.json
  def create
    @model = Model.new(models_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to net_product_model_path(@model.product, @model), notice: 'El modelo se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_product_model_path(@model.product, @model) }
      else
        format.html { render new_net_product_model_path, params: :params }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/products/1/models/1
  # PATCH/PUT /net/products/1/models/1.json
  def update
    respond_to do |format|
      @product = @model.product
      if @model.update(models_params)
        format.html { redirect_to net_product_model_path(@model.product, @model), notice: 'El modelo se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_product_model_path(@model.product, @model) }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/products/1/models/1
  # DELETE /net/products/1/models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to net_product_models_url(@product), notice: 'El modelo se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      begin
        @product = Product.find(params[:product_id])
      rescue => ex
        Raise ActionController::RoutingError.new(ex)
      end
    end
    def set_model
      @model = Model.find(params[:id])
    end
    def models_params
      params.require(:model).permit(:id, :name, :product, :product_id, :power, :max_useful_power, :security_brake, :engine_type, :chassis, :case_width, :cutting_height, :wheels, :collector_capacity, :cutting_surface, :weight, :packaging, :enabled, :engine_mounted_on, :reel_type, :use, :reel_diameter, :tube, :cutting_width, :includes, :color, :fuel_capacity, :housing_thickness, :documentation, :specification)
    end
end
