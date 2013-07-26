require 'spec_helper'

describe "teams/index" do
  before(:each) do
    assign(:teams, [
      stub_model(Team,
        :name => "Name",
        :avatar => "Avatar",
        :description => "MyText",
        :creator_name => "Creator Name",
        :user_id => 1
      ),
      stub_model(Team,
        :name => "Name",
        :avatar => "Avatar",
        :description => "MyText",
        :creator_name => "Creator Name",
        :user_id => 1
      )
    ])
  end

  it "renders a list of teams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Creator Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
