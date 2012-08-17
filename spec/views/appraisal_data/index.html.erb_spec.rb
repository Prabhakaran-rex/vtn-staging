require 'spec_helper'

describe "appraisal_data/index" do
  before(:each) do
    assign(:appraisal_data, [
      stub_model(AppraisalDatum,
        :appraisal => nil,
        :datatype => 1,
        :value => "Value"
      ),
      stub_model(AppraisalDatum,
        :appraisal => nil,
        :datatype => 1,
        :value => "Value"
      )
    ])
  end

  it "renders a list of appraisal_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
