class Net::OfficesController < Net::BaseController
  before_action :set_office, only: [:show, :edit, :update, :destroy]
  before_action :set_commerce, only: [:index, :new, :edit, :destroy]

  def index
    @filterrific = initialize_filterrific(
        Office.where(commerce_id: params[:commerce_id]),
        params[:filterrific],
        select_options: {
            sorted_by: Office.options_for_sorted_by,
            with_enabled: Office.options_for_enabled
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @offices = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/commerces/1/offices/1
  def show
  end

  # GET /net/commerces/1/offices/new
  def new
    @office = Office.new
  end

  # GET /net/commerces/1/offices/1/edit
  def edit
  end

  # POST /net/commerces/1/offices
  # POST /net/commerces/1/offices.json
  def create
    @office = Office.new(offices_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to net_commerce_office_path(@office.commerce, @office), notice: 'La sucursal se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_commerce_office_path(@office) }
      else
        puts @office.errors.to_a
        format.html { redirect_to new_net_commerce_office_path(@office.commerce, @office), notice: { error: @office.errors.full_messages} }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/commerces/1/offices/1
  # PATCH/PUT /net/commerces/1/offices/1.json
  def update
    respond_to do |format|
      @commerce = @office.commerce
      if @office.update(offices_params)
        format.html { redirect_to net_commerce_office_path(@office.commerce, @office), notice: 'La sucursal se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_commerce_office_path(@office.commerce, @office) }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/commerces/1/offices/1
  # DELETE /net/commerces/1/offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to net_commerce_offices_url(@commerce), notice: 'La sucursal se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_commerce
      begin
        @commerce = Commerce.find(params[:commerce_id])
      rescue => ex
        Raise ActionController::RoutingError.new(ex)
      end
    end
    def set_office
      @office = Office.find(params[:id])
    end
    def offices_params
      params.require(:office).permit(:id, :fantasy_name, :office_type, :is_sales, :is_technical_support, :url, :notes , :commerce, :commerce_id, :city, :city_id, :street, :number, :floor, :appartment, :enabled)
    end
end