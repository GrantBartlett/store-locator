require "rails_helper"

RSpec.describe LocationsController, type: :routing do
  describe "routing" do

    let(:brand) { create(:brand_with_location) }

    it "routes to #index" do
      expect(:get => "/brands/K1-6eC7soshrx75UesiJQQ==/locations").to route_to("locations#index", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #new" do
      expect(:get => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/new").to route_to("locations#new", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #show" do
      expect(:get => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/1").to route_to("locations#show", :id => "1", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #edit" do
      expect(:get => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/1/edit").to route_to("locations#edit", :id => "1", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #create" do
      expect(:post => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/").to route_to("locations#create", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #update via PUT" do
      expect(:put => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/1").to route_to("locations#update", :id => "1", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/1").to route_to("locations#update", :id => "1", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

    it "routes to #destroy" do
      expect(:delete => "/brands/K1-6eC7soshrx75UesiJQQ==/locations/1").to route_to("locations#destroy", :id => "1", :brand_id => "K1-6eC7soshrx75UesiJQQ==")
    end

  end
end
