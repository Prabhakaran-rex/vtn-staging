require 'spec_helper'

describe "trade_references/index" do
  before(:each) do
    assign(:trade_references, [
      stub_model(TradeReference,
        :company => "Company",
        :contact => "Contact",
        :phone => "Phone",
        :user => nil
      ),
      stub_model(TradeReference,
        :company => "Company",
        :contact => "Contact",
        :phone => "Phone",
        :user => nil
      )
    ])
  end

  it "renders a list of trade_references" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
