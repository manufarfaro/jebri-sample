class Net::BaseController < ApplicationController
  layout 'application.net'
  before_action :authenticate_user!
end
