class Api::BaseController < ActionController::API
  include AbstractController::Translation
  respond_to :json
end
