require 'spec_helper'

describe "clclasses/index" do
  before(:each) do
    assign(:clclasses, [
      stub_model(Clclass),
      stub_model(Clclass)
    ])
  end

  it "renders a list of clclasses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
