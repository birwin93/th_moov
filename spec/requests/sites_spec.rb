require 'spec_helper'

describe "Site" do
	
	subject { page }

	describe "Landing Page" do
		before { visit root_path }

		it { should have_selector('title', text: 'Th Moov') }

	end

	describe "About Page" do
		before { visit about_path }

		it { should have_selector('title', text: 'Th Moov | About') }
	
	end

	describe "Contact Page" do
		before { visit contact_path }

		it { page.should have_selector('title', text: 'Th Moov | Contact') }

	end

	describe "Help Page" do
		before { visit help_path }

		it { page.should have_selector('title', text: 'Th Moov | Help') }

	end

end
