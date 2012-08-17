require 'spec_helper'

describe "skills/show" do
  before(:each) do
    @skill = assign(:skill, stub_model(Skill,
      :discipline => "Discipline",
      :since => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Discipline/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
