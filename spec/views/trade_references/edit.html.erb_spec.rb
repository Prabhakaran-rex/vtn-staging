require 'spec_helper'

describe "trade_references/edit" do
  before(:each) do
    @trade_reference = assign(:trade_reference, stub_model(TradeReference,
      :company => "MyString",
      :contact => "MyString",
      :phone => "MyString",
      :user => nil
    ))
  end

  it "renders the edit trade_reference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trade_references_path(@trade_reference), :method => "post" do
      assert_select "input#trade_reference_company", :name => "trade_reference[company]"
      assert_select "input#trade_reference_contact", :name => "trade_reference[contact]"
      assert_select "input#trade_reference_phone", :name => "trade_reference[phone]"
      assert_select "input#trade_reference_user", :name => "trade_reference[user]"
    end
  end
end
