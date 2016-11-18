require 'rails_helper'

RSpec.describe Net::BaseController, type: :controller do
  controller do
    def index
      raise ApplicationController::AccessDenied
    end
  end

  describe 'anonymous user' do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it 'should be redirected to signin' do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
  end

  describe 'logged user' do
    it 'should let a user see dashboard page on login' do
      login_with create( :client_user )
      get :index
      expect( response ).to render_template( :index )
    end

  end
end
