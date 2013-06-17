require 'spec_helper'

describe "clclasses/new" do
  before(:each) do
    assign(:clclass, stub_model(Clclass).as_new_record)
  end

  it "renders new clclass form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clclasses_path, :method => "post" do
    end
  end
end
