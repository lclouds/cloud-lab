require 'spec_helper'

describe "teams/show" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :name => "Name",
      :avatar => "Avatar",
      :description => "MyText",
      :creator_name => "Creator Name",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Avatar/)
    rendered.should match(/MyText/)
    rendered.should match(/Creator Name/)
    rendered.should match(/1/)
  end
end
