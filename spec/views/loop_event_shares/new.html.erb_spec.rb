require 'spec_helper'

describe "loop_event_shares/new" do
  before(:each) do
    assign(:loop_event_share, stub_model(LoopEventShare).as_new_record)
  end

  it "renders new loop_event_share form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loop_event_shares_path, :method => "post" do
    end
  end
end
