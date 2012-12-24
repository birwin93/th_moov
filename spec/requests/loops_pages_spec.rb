require 'spec_helper'

describe "Loops Pages" do
	
	subject { page }

	
	 let(:user) { FactoryGirl.create(:user) }
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
  end

  describe "should not be able to access loop you are not in" do
  	before { visit loop_path(chiphi) }
  
  	it { should have_selector('h1', text: 'My Loops') }
  end

end
