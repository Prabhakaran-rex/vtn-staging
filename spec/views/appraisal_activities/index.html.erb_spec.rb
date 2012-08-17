require 'spec_helper'

describe "appraisal_activities/index" do
  before(:each) do
    assign(:appraisal_activities, [
      stub_model(AppraisalActivity,
        :appraisal => "",
        :user => nil,
        :activity_type => 1,
        :activity_value => 2
      ),
      stub_model(AppraisalActivity,
        :appraisal => "",
        :user => nil,
        :activity_type => 1,
        :activity_value => 2
      )
    ])
  end

  it "renders a list of appraisal_activities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
