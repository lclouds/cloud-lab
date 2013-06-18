require "spec_helper"

describe ClclassesController do
  describe "routing" do

    it "routes to #index" do
      get("/clclasses").should route_to("clclasses#index")
    end

    it "routes to #new" do
      get("/clclasses/new").should route_to("clclasses#new")
    end

    it "routes to #show" do
      get("/clclasses/1").should route_to("clclasses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clclasses/1/edit").should route_to("clclasses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clclasses").should route_to("clclasses#create")
    end

    it "routes to #update" do
      put("/clclasses/1").should route_to("clclasses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clclasses/1").should route_to("clclasses#destroy", :id => "1")
    end

  end
end
