require 'spec_helper'

describe "loop_event_shares/index" do
  before(:each) do
    assign(:loop_event_shares, [
      stub_model(LoopEventShare),
      stub_model(LoopEventShare)
    ])
  end

  it "renders a list of loop_event_shares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
