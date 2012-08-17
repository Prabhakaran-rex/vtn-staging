require "spec_helper"

describe AppraisalsController do
  describe "routing" do

    it "routes to #index" do
      get("/appraisals").should route_to("appraisals#index")
    end

    it "routes to #new" do
      get("/appraisals/new").should route_to("appraisals#new")
    end

    it "routes to #show" do
      get("/appraisals/1").should route_to("appraisals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/appraisals/1/edit").should route_to("appraisals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/appraisals").should route_to("appraisals#create")
    end

    it "routes to #update" do
      put("/appraisals/1").should route_to("appraisals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/appraisals/1").should route_to("appraisals#destroy", :id => "1")
    end

  end
end
