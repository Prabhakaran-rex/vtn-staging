require "spec_helper"

describe AppraisalActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/appraisal_activities").should route_to("appraisal_activities#index")
    end

    it "routes to #new" do
      get("/appraisal_activities/new").should route_to("appraisal_activities#new")
    end

    it "routes to #show" do
      get("/appraisal_activities/1").should route_to("appraisal_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/appraisal_activities/1/edit").should route_to("appraisal_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/appraisal_activities").should route_to("appraisal_activities#create")
    end

    it "routes to #update" do
      put("/appraisal_activities/1").should route_to("appraisal_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/appraisal_activities/1").should route_to("appraisal_activities#destroy", :id => "1")
    end

  end
end
