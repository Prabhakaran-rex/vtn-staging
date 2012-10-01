require 'spec_helper'

describe "TradeReferences" do
  describe "GET /trade_references" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get trade_references_path
      response.status.should be(200)
    end
  end
end
