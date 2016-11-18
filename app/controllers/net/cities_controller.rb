class Net::CitiesController < Net::BaseController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :set_state, only: [:index, :new, :edit, :destroy]

  def index
    @filterrific = initialize_filterrific(
        City.where(state_id: params[:state_id]),
        params[:filterrific],
        select_options: {
            sorted_by: City.options_for_sorted_by,
            with_enabled: City.options_for_enabled
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @cities = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/states/1/cities/1
  def show
  end

  # GET /net/states/1/cities/new
  def new
    @city = City.new
  end

  # GET /net/states/1/cities/1/edit
  def edit
  end

  # POST /net/states/1/cities
  # POST /net/states/1/cities.json
  def create
    @city = City.new(cities_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to net_state_city_path(@city.state, @city), notice: 'La ciudad se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_state_city_path(@city) }
      else
        format.html { render new_net_state_city_path(@city.state, @city), params: :params }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/states/1/cities/1
  # PATCH/PUT /net/states/1/cities/1.json
  def update
    respond_to do |format|
      @state = @city.state
      if @city.update(cities_params)
        format.html { redirect_to net_state_cities_path(@city), notice: 'La ciudad se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_state_cities_path(@city) }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/states/1/cities/1
  # DELETE /net/states/1/cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to net_state_cities_url(@state), notice: 'La ciuda se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
  def set_state
    begin
      @state = State.find(params[:state_id])
    rescue => ex
      Raise ActionController::RoutingError.new(ex)
    end
  end
  def set_city
    @city = City.find(params[:id])
  end
  def cities_params
    params.require(:city).permit(:id, :name, :state, :state_id, :enabled)
  end
end