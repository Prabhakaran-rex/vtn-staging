require 'spec_helper'

describe "payments/index" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :user => nil,
        :appraisal => nil,
        :is_charged => false,
        :auth_code => "Auth Code",
        :ccnum => "Ccnum",
        :amount => 1.5,
        :is_refund => false
      ),
      stub_model(Payment,
        :user => nil,
        :appraisal => nil,
        :is_charged => false,
        :auth_code => "Auth Code",
        :ccnum => "Ccnum",
        :amount => 1.5,
        :is_refund => false
      )
    ])
  end

  it "renders a list of payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Auth Code".to_s, :count => 2
    assert_select "tr>td", :text => "Ccnum".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
