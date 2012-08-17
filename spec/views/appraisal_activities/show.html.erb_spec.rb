require 'spec_helper'

describe "appraisal_activities/show" do
  before(:each) do
    @appraisal_activity = assign(:appraisal_activity, stub_model(AppraisalActivity,
      :appraisal => "",
      :user => nil,
      :activity_type => 1,
      :activity_value => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
