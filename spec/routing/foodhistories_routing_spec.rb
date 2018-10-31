require "rails_helper"

RSpec.describe FoodhistoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/foodhistories").to route_to("foodhistories#index")
    end

    it "routes to #new" do
      expect(:get => "/foodhistories/new").to route_to("foodhistories#new")
    end

    it "routes to #show" do
      expect(:get => "/foodhistories/1").to route_to("foodhistories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/foodhistories/1/edit").to route_to("foodhistories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/foodhistories").to route_to("foodhistories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/foodhistories/1").to route_to("foodhistories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/foodhistories/1").to route_to("foodhistories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/foodhistories/1").to route_to("foodhistories#destroy", :id => "1")
    end

  end
end
