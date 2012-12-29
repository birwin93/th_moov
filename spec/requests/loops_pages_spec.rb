require 'spec_helper'

describe "Loops Pages" do
	
	subject { page }

	
	 let(:user) { FactoryGirl.create(:user) }
   let(:other_user) { FactoryGirl.create(:second_user) }
	 let(:thmoov) { FactoryGirl.create(:thmoov_loop) }
	 let(:chiphi) { FactoryGirl.create(:chiphi_loop) }

	before do
		sign_in user
  	user.loop_memberships.create(loop_id: thmoov.id)
	 	user.loop_memberships.first.accept!
	end

  describe "visiting user's loops page" do
  	before { visit loops_path }

  	it { should have_selector('h1', text: 'My Loops') }
  	it { should have_link(thmoov.name, href: loop_path(thmoov)) }
  	it { should_not have_link(chiphi.name, href: loop_path(chiphi)) }
    it { should have_link("+", href: new_loop_path) }

    describe "visit loop page" do
      before { click_link "Th Moov" }

      it { should have_link("Add Friend", href: loop_loop_memberships_path(thmoov)) }

      describe "adding friend to loop" do 
        before do
          fill_in "Firstname", with: other_user.firstName
        end
        it "should send request" do
          expect { click_link "Add Friend" }.to change(LoopMembership, :count)
        end
      end
    end

    describe "visiting new loop page" do 
      before { click_link "+" }

      it { should have_selector("h1", title: "Create a Loop") }

      describe "creating with valid info" do
        before do
          fill_in "Name", with: "Th Moov"
          fill_in "Description", with: "Kickass Startup"
          select "Closed"
        end
        it "should create loop and loop membership for current user" do
          expect { click_button "Create Loop" }.to change(user.loop_memberships, :count)
        end
    
      end

      describe "creating with invalid info" do
        it "should not work" do
          expect { click_button "Create Loop" }.not_to change(Loop, :count)
        end
      end

    end

  end

  describe "should not be able to access loop you are not in" do
  	before { visit loop_path(chiphi) }
  
  	it { should have_selector('h1', text: 'My Loops') }
  end

 
end
