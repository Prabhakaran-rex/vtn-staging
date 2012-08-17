require 'spec_helper'

describe "appraisal_data/show" do
  before(:each) do
    @appraisal_datum = assign(:appraisal_datum, stub_model(AppraisalDatum,
      :appraisal => nil,
      :datatype => 1,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/Value/)
  end
end
