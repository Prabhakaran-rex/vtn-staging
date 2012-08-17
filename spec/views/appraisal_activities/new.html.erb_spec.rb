require 'spec_helper'

describe "appraisal_activities/new" do
  before(:each) do
    assign(:appraisal_activity, stub_model(AppraisalActivity,
      :appraisal => "",
      :user => nil,
      :activity_type => 1,
      :activity_value => 1
    ).as_new_record)
  end

  it "renders new appraisal_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appraisal_activities_path, :method => "post" do
      assert_select "input#appraisal_activity_appraisal", :name => "appraisal_activity[appraisal]"
      assert_select "input#appraisal_activity_user", :name => "appraisal_activity[user]"
      assert_select "input#appraisal_activity_activity_type", :name => "appraisal_activity[activity_type]"
      assert_select "input#appraisal_activity_activity_value", :name => "appraisal_activity[activity_value]"
    end
  end
end
