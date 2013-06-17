require 'spec_helper'

describe "clclasses/edit" do
  before(:each) do
    @clclass = assign(:clclass, stub_model(Clclass))
  end

  it "renders the edit clclass form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clclasses_path(@clclass), :method => "post" do
    end
  end
end
