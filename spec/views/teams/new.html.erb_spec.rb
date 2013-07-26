require 'spec_helper'

describe "teams/new" do
  before(:each) do
    assign(:team, stub_model(Team,
      :name => "MyString",
      :avatar => "MyString",
      :description => "MyText",
      :creator_name => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teams_path, :method => "post" do
      assert_select "input#team_name", :name => "team[name]"
      assert_select "input#team_avatar", :name => "team[avatar]"
      assert_select "textarea#team_description", :name => "team[description]"
      assert_select "input#team_creator_name", :name => "team[creator_name]"
      assert_select "input#team_user_id", :name => "team[user_id]"
    end
  end
end
