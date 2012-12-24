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
		before do
			sign_in(user)
			visit user_path(user) 
		end

		it { should have_selector('title', text: user.firstName) }
		it { should have_selector('p', text: user.full_name) }

	end

	describe "edit page" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in(user)
			visit edit_user_path(user) 
		end	

		describe "page" do 
			it { should have_selector('h1', text: "Edit #{user.firstName}") }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }
			it { should have_content('error') }
		end

		describe "with valid information" do
			before do
				fill_in "Email", with: "new@email.com"
				fill_in "Firstname", with: "New"
				fill_in "Lastname", with: "Name"
				fill_in "Password", with: user.password
				fill_in "Confirmation", with: user.password
				click_button "Save changes"
			end

			it { should have_selector('title', text: 'New') }
			it { should have_selector('p', text: 'New Name') }
		end

	end


end
