require 'spec_helper'

describe "appraiser_access_tokens/index" do
  before(:each) do
    assign(:appraiser_access_tokens, [
      stub_model(AppraiserAccessToken,
        :user => nil,
        :token => "Token",
        :email => "Email",
        :name => "Name"
      ),
      stub_model(AppraiserAccessToken,
        :user => nil,
        :token => "Token",
        :email => "Email",
        :name => "Name"
      )
    ])
  end

  it "renders a list of appraiser_access_tokens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
