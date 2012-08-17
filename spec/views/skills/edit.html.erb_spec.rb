require 'spec_helper'

describe "skills/edit" do
  before(:each) do
    @skill = assign(:skill, stub_model(Skill,
      :discipline => "MyString",
      :since => 1,
      :user => nil
    ))
  end

  it "renders the edit skill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => skills_path(@skill), :method => "post" do
      assert_select "input#skill_discipline", :name => "skill[discipline]"
      assert_select "input#skill_since", :name => "skill[since]"
      assert_select "input#skill_user", :name => "skill[user]"
    end
  end
end
