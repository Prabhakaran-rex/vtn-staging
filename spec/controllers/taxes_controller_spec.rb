require 'spec_helper'

describe TaxesController do

  describe "GET 'irs_income'" do
    it "returns http success" do
      get 'irs_income'
      response.should be_success
    end
  end

end
