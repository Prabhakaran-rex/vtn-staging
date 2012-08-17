require "spec_helper"

describe AppraiserAccessTokensController do
  describe "routing" do

    it "routes to #index" do
      get("/appraiser_access_tokens").should route_to("appraiser_access_tokens#index")
    end

    it "routes to #new" do
      get("/appraiser_access_tokens/new").should route_to("appraiser_access_tokens#new")
    end

    it "routes to #show" do
      get("/appraiser_access_tokens/1").should route_to("appraiser_access_tokens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/appraiser_access_tokens/1/edit").should route_to("appraiser_access_tokens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/appraiser_access_tokens").should route_to("appraiser_access_tokens#create")
    end

    it "routes to #update" do
      put("/appraiser_access_tokens/1").should route_to("appraiser_access_tokens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/appraiser_access_tokens/1").should route_to("appraiser_access_tokens#destroy", :id => "1")
    end

  end
end
