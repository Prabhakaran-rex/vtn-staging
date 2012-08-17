require 'spec_helper'

describe "appraiser_access_tokens/edit" do
  before(:each) do
    @appraiser_access_token = assign(:appraiser_access_token, stub_model(AppraiserAccessToken,
      :user => nil,
      :token => "MyString",
      :email => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit appraiser_access_token form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appraiser_access_tokens_path(@appraiser_access_token), :method => "post" do
      assert_select "input#appraiser_access_token_user", :name => "appraiser_access_token[user]"
      assert_select "input#appraiser_access_token_token", :name => "appraiser_access_token[token]"
      assert_select "input#appraiser_access_token_email", :name => "appraiser_access_token[email]"
      assert_select "input#appraiser_access_token_name", :name => "appraiser_access_token[name]"
    end
  end
end
