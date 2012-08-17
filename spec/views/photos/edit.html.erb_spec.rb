require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :appraisal => nil,
      :user => nil
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path(@photo), :method => "post" do
      assert_select "input#photo_appraisal", :name => "photo[appraisal]"
      assert_select "input#photo_user", :name => "photo[user]"
    end
  end
end
