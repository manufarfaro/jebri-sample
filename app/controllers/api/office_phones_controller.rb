class Api::OfficePhonesController < Api::BaseController
  before_action :set_phone, only: [:show]
  def index
    @office_phones = OfficePhone.enabled.where(office: params[:office_id])
  end
  def show
  end
  private
  def set_phone
    @phone = OfficePhone.enabled.find(params[:id])
  end
end