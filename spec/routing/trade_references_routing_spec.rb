require "spec_helper"

describe TradeReferencesController do
  describe "routing" do

    it "routes to #index" do
      get("/trade_references").should route_to("trade_references#index")
    end

    it "routes to #new" do
      get("/trade_references/new").should route_to("trade_references#new")
    end

    it "routes to #show" do
      get("/trade_references/1").should route_to("trade_references#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trade_references/1/edit").should route_to("trade_references#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trade_references").should route_to("trade_references#create")
    end

    it "routes to #update" do
      put("/trade_references/1").should route_to("trade_references#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trade_references/1").should route_to("trade_references#destroy", :id => "1")
    end

  end
end
