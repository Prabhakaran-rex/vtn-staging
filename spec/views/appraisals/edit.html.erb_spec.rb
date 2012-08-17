require 'spec_helper'

describe "appraisals/edit" do
  before(:each) do
    @appraisal = assign(:appraisal, stub_model(Appraisal,
      :name => "MyString",
      :dimensions => "MyString",
      :materials => "MyString",
      :country_of_origin => "MyString",
      :makers_marks => "MyString",
      :damage => "MyString",
      :year_of_manufacture => "MyString",
      :where_was_it_obtained => "MyString",
      :how_was_it_obtained => "MyString",
      :appraiser_number => "MyString",
      :value_of_item => "MyString",
      :historical_significance => "MyString",
      :number_of_pieces_created => "MyString",
      :where_it_was_manufactured => "MyString",
      :when_it_was_used => "MyString",
      :how_it_was_used => "MyString",
      :selected_plan => 1,
      :status => 1
    ))
  end

  it "renders the edit appraisal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appraisals_path(@appraisal), :method => "post" do
      assert_select "input#appraisal_name", :name => "appraisal[name]"
      assert_select "input#appraisal_dimensions", :name => "appraisal[dimensions]"
      assert_select "input#appraisal_materials", :name => "appraisal[materials]"
      assert_select "input#appraisal_country_of_origin", :name => "appraisal[country_of_origin]"
      assert_select "input#appraisal_makers_marks", :name => "appraisal[makers_marks]"
      assert_select "input#appraisal_damage", :name => "appraisal[damage]"
      assert_select "input#appraisal_year_of_manufacture", :name => "appraisal[year_of_manufacture]"
      assert_select "input#appraisal_where_was_it_obtained", :name => "appraisal[where_was_it_obtained]"
      assert_select "input#appraisal_how_was_it_obtained", :name => "appraisal[how_was_it_obtained]"
      assert_select "input#appraisal_appraiser_number", :name => "appraisal[appraiser_number]"
      assert_select "input#appraisal_value_of_item", :name => "appraisal[value_of_item]"
      assert_select "input#appraisal_historical_significance", :name => "appraisal[historical_significance]"
      assert_select "input#appraisal_number_of_pieces_created", :name => "appraisal[number_of_pieces_created]"
      assert_select "input#appraisal_where_it_was_manufactured", :name => "appraisal[where_it_was_manufactured]"
      assert_select "input#appraisal_when_it_was_used", :name => "appraisal[when_it_was_used]"
      assert_select "input#appraisal_how_it_was_used", :name => "appraisal[how_it_was_used]"
      assert_select "input#appraisal_selected_plan", :name => "appraisal[selected_plan]"
      assert_select "input#appraisal_status", :name => "appraisal[status]"
    end
  end
end
