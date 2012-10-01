require 'spec_helper'

describe "trade_references/new" do
  before(:each) do
    assign(:trade_reference, stub_model(TradeReference,
      :company => "MyString",
      :contact => "MyString",
      :phone => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new trade_reference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trade_references_path, :method => "post" do
      assert_select "input#trade_reference_company", :name => "trade_reference[company]"
      assert_select "input#trade_reference_contact", :name => "trade_reference[contact]"
      assert_select "input#trade_reference_phone", :name => "trade_reference[phone]"
      assert_select "input#trade_reference_user", :name => "trade_reference[user]"
    end
  end
end
