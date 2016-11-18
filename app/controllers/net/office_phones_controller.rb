class Net::OfficePhonesController < Net::BaseController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
  before_action :set_office, only: [:index, :new, :show, :create, :edit, :destroy]

  def index
    @filterrific = initialize_filterrific(
        OfficePhone.where(office_id: params[:office_id] ),
        params[:filterrific],
        select_options: {
            sorted_by: OfficePhone.options_for_sorted_by,
            with_enabled: OfficePhone.options_for_enabled
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @phones = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/commerces/1/offices/1/office_phones/1
  def show
  end

  # GET /net/commerces/1/offices/1/office_phones/new
  def new
    @phone = OfficePhone.new
  end

  # GET /net/commerces/1/offices/1/office_phones/1/edit
  def edit
  end

  # POST /net/commerces/1/offices/1/office_phones/1
  # POST /net/commerces/1/offices/1/office_phones/1.json
  def create
    @phone = OfficePhone.new(phones_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to net_commerce_office_office_phone_path(@office.commerce, @office, @phone), notice: 'El Teléfono se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: net_commerce_office_office_phone_path(@phone.office.commerce, @phone.office, @phone) }
      else
        format.html { redirect_to new_net_commerce_office_office_phone_path(@office.commerce, @office, @phone), notice: { error: @phone.errors.full_messages} }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/commerces/1/offices/1
  # PATCH/PUT /net/commerces/1/offices/1.json
  def update
    respond_to do |format|
      @office = @phone.office
      if @phone.update(phones_params)
        format.html { redirect_to net_commerce_office_office_phones_path(@phone.office.commerce, @phone.office), notice: 'El Teléfono se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_commerce_office_office_phones_path(@phone.office.commerce, @phone.office) }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/commerces/1/offices/1
  # DELETE /net/commerces/1/offices/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to net_commerce_office_office_phones_path(@office.commerce, @office), notice: 'El Teléfono se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
  def set_office
    begin
      @office = Office.find(params[:office_id])
    rescue => ex
      Raise ActionController::RoutingError.new(ex)
    end
  end
  def set_phone
    @phone = OfficePhone.find(params[:id])
  end
  def phones_params
    params.require(:office_phone).permit(:id, :phone_type, :number, :office, :office_id, :notes, :enabled)
  end
end