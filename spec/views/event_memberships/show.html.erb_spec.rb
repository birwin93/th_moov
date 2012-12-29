require 'spec_helper'

describe "event_memberships/show" do
  before(:each) do
    @event_membership = assign(:event_membership, stub_model(EventMembership,
      :only => "Only",
      :[ => "",
      : => "",
      : => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Only/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
