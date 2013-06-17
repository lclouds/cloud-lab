require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :name => "MyString",
      :full_name => "MyString",
      :code => 1,
      :introduction => "MyText"
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path, :method => "post" do
      assert_select "input#course_name", :name => "course[name]"
      assert_select "input#course_full_name", :name => "course[full_name]"
      assert_select "input#course_code", :name => "course[code]"
      assert_select "textarea#course_introduction", :name => "course[introduction]"
    end
  end
end
