require "spec_helper"

describe EventMembershipsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_memberships").should route_to("event_memberships#index")
    end

    it "routes to #new" do
      get("/event_memberships/new").should route_to("event_memberships#new")
    end

    it "routes to #show" do
      get("/event_memberships/1").should route_to("event_memberships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_memberships/1/edit").should route_to("event_memberships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_memberships").should route_to("event_memberships#create")
    end

    it "routes to #update" do
      put("/event_memberships/1").should route_to("event_memberships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_memberships/1").should route_to("event_memberships#destroy", :id => "1")
    end

  end
end
