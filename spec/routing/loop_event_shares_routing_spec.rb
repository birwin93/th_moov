require "spec_helper"

describe LoopEventSharesController do
  describe "routing" do

    it "routes to #index" do
      get("/loop_event_shares").should route_to("loop_event_shares#index")
    end

    it "routes to #new" do
      get("/loop_event_shares/new").should route_to("loop_event_shares#new")
    end

    it "routes to #show" do
      get("/loop_event_shares/1").should route_to("loop_event_shares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/loop_event_shares/1/edit").should route_to("loop_event_shares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/loop_event_shares").should route_to("loop_event_shares#create")
    end

    it "routes to #update" do
      put("/loop_event_shares/1").should route_to("loop_event_shares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/loop_event_shares/1").should route_to("loop_event_shares#destroy", :id => "1")
    end

  end
end
