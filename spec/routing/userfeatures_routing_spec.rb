require "rails_helper"

RSpec.describe UserfeaturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/userfeatures").to route_to("userfeatures#index")
    end

    it "routes to #new" do
      expect(:get => "/userfeatures/new").to route_to("userfeatures#new")
    end

    it "routes to #show" do
      expect(:get => "/userfeatures/1").to route_to("userfeatures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/userfeatures/1/edit").to route_to("userfeatures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/userfeatures").to route_to("userfeatures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/userfeatures/1").to route_to("userfeatures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/userfeatures/1").to route_to("userfeatures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/userfeatures/1").to route_to("userfeatures#destroy", :id => "1")
    end

  end
end
