require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "signup" do 
		before { visit signup_path }
		it { should have_selector('title', text: 'Th Moov | Signup') }

		describe "with valid information" do
			before do
				fill_in "Firstname", with: "Example"
				fill_in "Lastname", with: "User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "Password"
				fill_in "Confirmation", with: "Password"
			end

			it "should create a user" do
				expect { click_button "Create my account" }.to change(User, :count)
			end
		end

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button "Create my account" }.not_to change(User, :count)
			end
		end

	end
	
	describe "profile page" do 
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

	end

end
