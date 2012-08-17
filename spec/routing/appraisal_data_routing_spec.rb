require "spec_helper"

describe AppraisalDataController do
  describe "routing" do

    it "routes to #index" do
      get("/appraisal_data").should route_to("appraisal_data#index")
    end

    it "routes to #new" do
      get("/appraisal_data/new").should route_to("appraisal_data#new")
    end

    it "routes to #show" do
      get("/appraisal_data/1").should route_to("appraisal_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/appraisal_data/1/edit").should route_to("appraisal_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/appraisal_data").should route_to("appraisal_data#create")
    end

    it "routes to #update" do
      put("/appraisal_data/1").should route_to("appraisal_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/appraisal_data/1").should route_to("appraisal_data#destroy", :id => "1")
    end

  end
end
