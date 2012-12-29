require 'spec_helper'

describe "loop_event_shares/edit" do
  before(:each) do
    @loop_event_share = assign(:loop_event_share, stub_model(LoopEventShare))
  end

  it "renders the edit loop_event_share form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loop_event_shares_path(@loop_event_share), :method => "post" do
    end
  end
end
