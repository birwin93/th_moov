require 'spec_helper'

describe "event_memberships/edit" do
  before(:each) do
    @event_membership = assign(:event_membership, stub_model(EventMembership,
      :only => "MyString",
      :[ => "",
      : => "",
      : => ""
    ))
  end

  it "renders the edit event_membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_memberships_path(@event_membership), :method => "post" do
      assert_select "input#event_membership_only", :name => "event_membership[only]"
      assert_select "input#event_membership_[", :name => "event_membership[[]"
      assert_select "input#event_membership_", :name => "event_membership[]"
      assert_select "input#event_membership_", :name => "event_membership[]"
    end
  end
end
