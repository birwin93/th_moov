require 'spec_helper'

describe "event_memberships/index" do
  before(:each) do
    assign(:event_memberships, [
      stub_model(EventMembership,
        :only => "Only",
        :[ => "",
        : => "",
        : => ""
      ),
      stub_model(EventMembership,
        :only => "Only",
        :[ => "",
        : => "",
        : => ""
      )
    ])
  end

  it "renders a list of event_memberships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Only".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
