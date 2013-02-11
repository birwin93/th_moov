require 'spec_helper'

describe "organizations/new" do
  before(:each) do
    assign(:organization, stub_model(Organization,
      :name => "MyString",
      :email => "MyString",
      :password => "",
      :password_confirmation => "",
      :password_digest => "",
      :remember_token => "MyString"
    ).as_new_record)
  end

  it "renders new organization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organizations_path, :method => "post" do
      assert_select "input#organization_name", :name => "organization[name]"
      assert_select "input#organization_email", :name => "organization[email]"
      assert_select "input#organization_password", :name => "organization[password]"
      assert_select "input#organization_password_confirmation", :name => "organization[password_confirmation]"
      assert_select "input#organization_password_digest", :name => "organization[password_digest]"
      assert_select "input#organization_remember_token", :name => "organization[remember_token]"
    end
  end
end