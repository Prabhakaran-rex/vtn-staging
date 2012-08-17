require 'spec_helper'

describe "appraisals/show" do
  before(:each) do
    @appraisal = assign(:appraisal, stub_model(Appraisal,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Dimensions/)
    rendered.should match(/Materials/)
    rendered.should match(/Country Of Origin/)
    rendered.should match(/Makers Marks/)
    rendered.should match(/Damage/)
    rendered.should match(/Year Of Manufacture/)
    rendered.should match(/Where Was It Obtained/)
    rendered.should match(/How Was It Obtained/)
    rendered.should match(/Appraiser Number/)
    rendered.should match(/Value Of Item/)
    rendered.should match(/Historical Significance/)
    rendered.should match(/Number Of Pieces Created/)
    rendered.should match(/Where It Was Manufactured/)
    rendered.should match(/When It Was Used/)
    rendered.should match(/How It Was Used/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
