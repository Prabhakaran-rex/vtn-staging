require 'spec_helper'

describe "trade_references/show" do
  before(:each) do
    @trade_reference = assign(:trade_reference, stub_model(TradeReference,
      :company => "Company",
      :contact => "Contact",
      :phone => "Phone",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company/)
    rendered.should match(/Contact/)
    rendered.should match(/Phone/)
    rendered.should match(//)
  end
end
