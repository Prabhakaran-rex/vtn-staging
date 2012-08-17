require 'spec_helper'

describe "appraisals/index" do
  before(:each) do
    assign(:appraisals, [
      stub_model(Appraisal,
        :name => "Name",
        :dimensions => "Dimensions",
        :materials => "Materials",
        :country_of_origin => "Country Of Origin",
        :makers_marks => "Makers Marks",
        :damage => "Damage",
        :year_of_manufacture => "Year Of Manufacture",
        :where_was_it_obtained => "Where Was It Obtained",
        :how_was_it_obtained => "How Was It Obtained",
        :appraiser_number => "Appraiser Number",
        :value_of_item => "Value Of Item",
        :historical_significance => "Historical Significance",
        :number_of_pieces_created => "Number Of Pieces Created",
        :where_it_was_manufactured => "Where It Was Manufactured",
        :when_it_was_used => "When It Was Used",
        :how_it_was_used => "How It Was Used",
        :selected_plan => 1,
        :status => 2
      ),
      stub_model(Appraisal,
        :name => "Name",
        :dimensions => "Dimensions",
        :materials => "Materials",
        :country_of_origin => "Country Of Origin",
        :makers_marks => "Makers Marks",
        :damage => "Damage",
        :year_of_manufacture => "Year Of Manufacture",
        :where_was_it_obtained => "Where Was It Obtained",
        :how_was_it_obtained => "How Was It Obtained",
        :appraiser_number => "Appraiser Number",
        :value_of_item => "Value Of Item",
        :historical_significance => "Historical Significance",
        :number_of_pieces_created => "Number Of Pieces Created",
        :where_it_was_manufactured => "Where It Was Manufactured",
        :when_it_was_used => "When It Was Used",
        :how_it_was_used => "How It Was Used",
        :selected_plan => 1,
        :status => 2
      )
    ])
  end

  it "renders a list of appraisals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Dimensions".to_s, :count => 2
    assert_select "tr>td", :text => "Materials".to_s, :count => 2
    assert_select "tr>td", :text => "Country Of Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Makers Marks".to_s, :count => 2
    assert_select "tr>td", :text => "Damage".to_s, :count => 2
    assert_select "tr>td", :text => "Year Of Manufacture".to_s, :count => 2
    assert_select "tr>td", :text => "Where Was It Obtained".to_s, :count => 2
    assert_select "tr>td", :text => "How Was It Obtained".to_s, :count => 2
    assert_select "tr>td", :text => "Appraiser Number".to_s, :count => 2
    assert_select "tr>td", :text => "Value Of Item".to_s, :count => 2
    assert_select "tr>td", :text => "Historical Significance".to_s, :count => 2
    assert_select "tr>td", :text => "Number Of Pieces Created".to_s, :count => 2
    assert_select "tr>td", :text => "Where It Was Manufactured".to_s, :count => 2
    assert_select "tr>td", :text => "When It Was Used".to_s, :count => 2
    assert_select "tr>td", :text => "How It Was Used".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
