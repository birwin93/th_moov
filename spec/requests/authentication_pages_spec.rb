require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin" do
  	before { visit root_path }

  	describe "with invalid information" do
  		before { click_button "Login" }

  		it { should have_selector('title', text: 'Th Moov') }
  		it { should have_selector('div.alert.alert-error', text: "Invalid") }
  	end

  	describe "with valid information" do
  		let(:user) { FactoryGirl.create(:user) }
  		before do
  			fill_in "Email", with: user.email
  			fill_in "Password", with: user.password
  			click_button "Login"
  		end

  		it { should have_selector('title', text: user.firstName) }
  		it { should have_link('Logout', href: signout_path) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Sign up!') }
      end
  	end

  end

end
