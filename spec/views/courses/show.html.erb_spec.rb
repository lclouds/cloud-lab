require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "Name",
      :full_name => "Full Name",
      :code => 1,
      :introduction => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Full Name/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
