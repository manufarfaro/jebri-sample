class Net::UsersController < Net::BaseController
  before_action :set_net_user, only: [:show, :edit, :update, :destroy, :change_password, :update_password]

  # GET /net/users
  # GET /net/users.json
  def index
    #@net_users = User.all
    @filterrific = initialize_filterrific(
        User,
        params[:filterrific],
        select_options: {
          sorted_by: User.options_for_sorted_by,
          with_role: User.options_for_role
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @net_users = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /net/users/1
  # GET /net/users/1.json
  def show
  end

  # GET /net/users/new
  def new
    @net_user = User.new
  end

  # GET /net/users/1/edit
  def edit
  end

  #GET /net/users/1/change_password
  def change_password
  end

  # POST /net/users
  # POST /net/users.json
  def create
    @net_user = User.new(user_params)

    respond_to do |format|
      if @net_user.save
        format.html { redirect_to net_user_path(@net_user), notice: 'El usuario se ha creado satisdactoriamente.' }
        format.json { render :show, status: :created, location: net_user_path(@net_user) }
      else
        format.html { render new_net_user_path, params: :params }
        format.json { render json: @net_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /net/users/1
  # PATCH/PUT /net/users/1.json
  def update
    respond_to do |format|
      if @net_user.update(user_params)
        format.html { redirect_to net_user_path(@net_user), notice: 'El usuario se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: net_user_path(@net_user) }
      else
        format.html { render :edit }
        format.json { render json: @net_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /net/users/1
  # DELETE /net/users/1.json
  def destroy
    @net_user.destroy
    respond_to do |format|
      format.html { redirect_to net_users_url, notice: 'El usuario se ha borrado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_net_user
      @net_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def net_user_params
      params.fetch(:net_user, {})
    end

    def user_params
      # NOTE: Using `strong_parameters` gem
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :name, :role, :company_name, :surname)
    end

end
