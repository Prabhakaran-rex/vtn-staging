require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :user => nil,
      :appraisal => nil,
      :is_charged => false,
      :auth_code => "MyString",
      :ccnum => "MyString",
      :amount => 1.5,
      :is_refund => false
    ))
  end

  it "renders the edit payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path(@payment), :method => "post" do
      assert_select "input#payment_user", :name => "payment[user]"
      assert_select "input#payment_appraisal", :name => "payment[appraisal]"
      assert_select "input#payment_is_charged", :name => "payment[is_charged]"
      assert_select "input#payment_auth_code", :name => "payment[auth_code]"
      assert_select "input#payment_ccnum", :name => "payment[ccnum]"
      assert_select "input#payment_amount", :name => "payment[amount]"
      assert_select "input#payment_is_refund", :name => "payment[is_refund]"
    end
  end
end
