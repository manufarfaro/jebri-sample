class Net::CommercesController < Net::BaseController
  before_action :set_commerce, only: [:show, :edit, :update, :destroy]

  def index
    @filterrific = initialize_filterrific(
      Commerce,
      params[:filterrific],
      select_options: {
          sorted_by: Commerce.options_for_sorted_by,
          with_enabled: Commerce.options_for_enabled
      },
      persistence_id: 'shared_key',
      default_filter_params: {}
    ) or return
    @commerces = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/commerces/1
  def show
  end

  # GET /net/commerces/new
  def new
    @commerce = Commerce.new
  end

  # GET /net/commerces/1/edit
  def edit
  end

  # POST /net/commerces
  # POST /net/commerces.json
  def create
    @commerce = Commerce.new(commerce_params)

    respond_to do |format|
      if @commerce.save
        format.html { redirect_to net_commerce_path(@commerce), notice: 'El Comercio se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_commerce_path(@commerce) }
      else
        format.html { render new_net_commerce_path, params: :params }
        format.json { render json: @commerce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/commerces/1
  # PATCH/PUT /net/commerces/1.json
  def update
    respond_to do |format|
      if @commerce.update(commerce_params)
        format.html { redirect_to net_commerce_path(@commerce), notice: 'El Comercio se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_commerce_path(@commerce) }
      else
        format.html { render :edit }
        format.json { render json: @commerce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/commerces/1
  # DELETE /net/commerces/1.json
  def destroy
    @commerce.destroy
    respond_to do |format|
      format.html { redirect_to net_commerces_url, notice: 'El Comercio se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commerce
      @commerce = Commerce.find(params[:id])
    end
    def commerce_params
      params.require(:commerce).permit(:id, :name, :url, :avatar, :enabled)
    end
end
