require "spec_helper"

describe DeliveryTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/delivery_times").should route_to("delivery_times#index")
    end

    it "routes to #new" do
      get("/delivery_times/new").should route_to("delivery_times#new")
    end

    it "routes to #show" do
      get("/delivery_times/1").should route_to("delivery_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/delivery_times/1/edit").should route_to("delivery_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/delivery_times").should route_to("delivery_times#create")
    end

    it "routes to #update" do
      put("/delivery_times/1").should route_to("delivery_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/delivery_times/1").should route_to("delivery_times#destroy", :id => "1")
    end

  end
end
