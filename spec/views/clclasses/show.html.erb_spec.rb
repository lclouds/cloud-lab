require 'spec_helper'

describe "clclasses/show" do
  before(:each) do
    @clclass = assign(:clclass, stub_model(Clclass))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
