class Net::StatesController < Net::BaseController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  def index
    @filterrific = initialize_filterrific(
        State,
        params[:filterrific],
        select_options: {
            sorted_by: State.options_for_sorted_by,
            with_enabled: State.options_for_enabled
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @states = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/states/1
  def show
  end

  # GET /net/states/new
  def new
    @state = State.new
  end

  # GET /net/states/1/edit
  def edit
  end

  # POST /net/states
  # POST /net/states.json
  def create
    @state = State.new(states_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to net_state_path(@state), notice: 'La provincia se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_state_path(@state) }
      else
        format.html { render new_net_state_path, params: :params }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/states/1
  # PATCH/PUT /net/states/1.json
  def update
    respond_to do |format|
      if @state.update(states_params)
        format.html { redirect_to net_state_path(@state), notice: 'La provincia se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_state_path(@state) }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/states/1
  # DELETE /net/states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to net_states_url, notice: 'La provincia se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.find(params[:id])
  end
  def states_params
    params.require(:state).permit(:id, :country_alpha2, :name, :ISO3166_2, :enabled)
  end
end
