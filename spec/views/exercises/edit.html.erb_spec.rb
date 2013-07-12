require 'spec_helper'

describe "exercises/edit" do
  before(:each) do
    @exercise = assign(:exercise, stub_model(Exercise,
      :name => "MyString",
      :description => "MyText",
      :special_instruction => "MyText",
      :action_items => "MyText",
      :lecture => nil,
      :clclass => nil
    ))
  end

  it "renders the edit exercise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exercises_path(@exercise), :method => "post" do
      assert_select "input#exercise_name", :name => "exercise[name]"
      assert_select "textarea#exercise_description", :name => "exercise[description]"
      assert_select "textarea#exercise_special_instruction", :name => "exercise[special_instruction]"
      assert_select "textarea#exercise_action_items", :name => "exercise[action_items]"
      assert_select "input#exercise_lecture", :name => "exercise[lecture]"
      assert_select "input#exercise_clclass", :name => "exercise[clclass]"
    end
  end
end
