require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'terms'" do
    it "returns http success" do
      get 'terms'
      response.should be_success
    end
  end

  describe "GET 'categories'" do
    it "returns http success" do
      get 'categories'
      response.should be_success
    end
  end

  describe "GET 'exclusions'" do
    it "returns http success" do
      get 'exclusions'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      response.should be_success
    end
  end

  describe "GET 'how'" do
    it "returns http success" do
      get 'how'
      response.should be_success
    end
  end

  describe "GET 'become'" do
    it "returns http success" do
      get 'become'
      response.should be_success
    end
  end

end
