require "rails_helper"

RSpec.describe Net::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/net/users").to route_to("net/users#index")
    end

    it "routes to #new" do
      expect(:get => "/net/users/new").to route_to("net/users#new")
    end

    it "routes to #show" do
      expect(:get => "/net/users/1").to route_to("net/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/net/users/1/edit").to route_to("net/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/net/users").to route_to("net/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/net/users/1").to route_to("net/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/net/users/1").to route_to("net/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/net/users/1").to route_to("net/users#destroy", :id => "1")
    end

  end
end
