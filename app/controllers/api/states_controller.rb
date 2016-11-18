class Api::StatesController < Api::BaseController
  before_action :set_state, only: [:show]

  def index
    @states = State.with_offices.enabled
    @states = @states.where(offices: { is_sales: true }) if params[:is_sales].present?
    @states = @states.where(offices: { is_technical_support: true }) if params[:is_technical_support].present?
  end

  def show
  end

  private
    def set_state
      @state = State.find(params[:id])
    end
end