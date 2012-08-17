require 'spec_helper'

describe "payments/show" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :user => nil,
      :appraisal => nil,
      :is_charged => false,
      :auth_code => "Auth Code",
      :ccnum => "Ccnum",
      :amount => 1.5,
      :is_refund => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/Auth Code/)
    rendered.should match(/Ccnum/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end
