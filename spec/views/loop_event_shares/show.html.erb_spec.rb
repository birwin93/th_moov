require 'spec_helper'

describe "loop_event_shares/show" do
  before(:each) do
    @loop_event_share = assign(:loop_event_share, stub_model(LoopEventShare))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
