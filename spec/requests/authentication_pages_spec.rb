require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "authorization should redirect" do
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }

    describe "Users" do
      describe "show" do
        before { visit user_path(user) }
        it { should have_link('About', href: about_path) }
        it { should_not have_selector('p', text: user.full_name) }
      end
      describe "edit" do
        before { visit edit_user_path(user) }
        it { should have_link('About', href: about_path) }
        it { should_not have_selector('h1', text: user.firstName) }
      end
      describe "HTTP Put request" do
        before { put user_path(user) }
        specify { response.should  redirect_to(root_path) }
      end

      describe "friendly forwarding" do
        before do
          visit edit_user_path(user)
          sign_in user
        end
        describe "after signing in" do
          it { should have_selector('h1', text: "Edit #{user.firstName}") }
        end
      end
      
      describe "as wrong user" do
        before { sign_in user }
        describe "edit other user" do
          before { visit edit_user_path(wrong_user) }
          it { should_not have_selector('h1', text: wrong_user.firstName) }
          it { should have_selector('p', text: user.firstName) }
        end

        describe "put request to wrong user" do
          before { put user_path(wrong_user) }
          specify { response.should redirect_to(user_path(user)) }
        end
      end 
    end
  end




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
  			sign_in(user)
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
