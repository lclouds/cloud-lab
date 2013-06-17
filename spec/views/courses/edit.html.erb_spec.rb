require 'spec_helper'

describe "courses/edit" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "MyString",
      :full_name => "MyString",
      :code => 1,
      :introduction => "MyText"
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path(@course), :method => "post" do
      assert_select "input#course_name", :name => "course[name]"
      assert_select "input#course_full_name", :name => "course[full_name]"
      assert_select "input#course_code", :name => "course[code]"
      assert_select "textarea#course_introduction", :name => "course[introduction]"
    end
  end
end
