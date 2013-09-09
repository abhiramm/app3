require "spec_helper"

describe DurationsController do
  describe "routing" do

    it "routes to #index" do
      get("/durations").should route_to("durations#index")
    end

    it "routes to #new" do
      get("/durations/new").should route_to("durations#new")
    end

    it "routes to #show" do
      get("/durations/1").should route_to("durations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/durations/1/edit").should route_to("durations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/durations").should route_to("durations#create")
    end

    it "routes to #update" do
      put("/durations/1").should route_to("durations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/durations/1").should route_to("durations#destroy", :id => "1")
    end

  end
end
