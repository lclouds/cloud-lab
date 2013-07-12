require 'spec_helper'

describe "exercises/index" do
  before(:each) do
    assign(:exercises, [
      stub_model(Exercise,
        :name => "Name",
        :description => "MyText",
        :special_instruction => "MyText",
        :action_items => "MyText",
        :lecture => nil,
        :clclass => nil
      ),
      stub_model(Exercise,
        :name => "Name",
        :description => "MyText",
        :special_instruction => "MyText",
        :action_items => "MyText",
        :lecture => nil,
        :clclass => nil
      )
    ])
  end

  it "renders a list of exercises" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
