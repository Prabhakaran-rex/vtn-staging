require 'spec_helper'

describe "appraisal_data/edit" do
  before(:each) do
    @appraisal_datum = assign(:appraisal_datum, stub_model(AppraisalDatum,
      :appraisal => nil,
      :datatype => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit appraisal_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appraisal_data_path(@appraisal_datum), :method => "post" do
      assert_select "input#appraisal_datum_appraisal", :name => "appraisal_datum[appraisal]"
      assert_select "input#appraisal_datum_datatype", :name => "appraisal_datum[datatype]"
      assert_select "input#appraisal_datum_value", :name => "appraisal_datum[value]"
    end
  end
end
