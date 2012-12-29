require 'spec_helper'

describe "event_memberships/new" do
  before(:each) do
    assign(:event_membership, stub_model(EventMembership,
      :only => "MyString",
      :[ => "",
      : => "",
      : => ""
    ).as_new_record)
  end

  it "renders new event_membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_memberships_path, :method => "post" do
      assert_select "input#event_membership_only", :name => "event_membership[only]"
      assert_select "input#event_membership_[", :name => "event_membership[[]"
      assert_select "input#event_membership_", :name => "event_membership[]"
      assert_select "input#event_membership_", :name => "event_membership[]"
    end
  end
end
