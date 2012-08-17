require 'spec_helper'

describe "appraiser_access_tokens/show" do
  before(:each) do
    @appraiser_access_token = assign(:appraiser_access_token, stub_model(AppraiserAccessToken,
      :user => nil,
      :token => "Token",
      :email => "Email",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Token/)
    rendered.should match(/Email/)
    rendered.should match(/Name/)
  end
end
