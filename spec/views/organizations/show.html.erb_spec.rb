require 'spec_helper'

describe "organizations/show" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "Name",
      :email => "Email",
      :password => "",
      :password_confirmation => "",
      :password_digest => "",
      :remember_token => "Remember Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Remember Token/)
  end
end
