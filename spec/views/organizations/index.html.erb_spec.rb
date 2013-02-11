require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :name => "Name",
        :email => "Email",
        :password => "",
        :password_confirmation => "",
        :password_digest => "",
        :remember_token => "Remember Token"
      ),
      stub_model(Organization,
        :name => "Name",
        :email => "Email",
        :password => "",
        :password_confirmation => "",
        :password_digest => "",
        :remember_token => "Remember Token"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Remember Token".to_s, :count => 2
  end
end
