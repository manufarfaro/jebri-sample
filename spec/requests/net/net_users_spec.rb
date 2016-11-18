require 'rails_helper'

RSpec.describe "Net::Users", type: :request do
  describe "GET /net_users" do
    it "works! (now write some real specs)" do
      get net_users_path
      expect(response).to have_http_status(200)
    end
  end
end
