require 'spec_helper'

describe "Site" do
	
	describe "Landing Page" do
		before { visit root_path }

		it "should have the title 'Th Moov'" do
			page.should have_selector('title', text: 'Th Moov') 
		end

	end

	describe "About Page" do
		before { visit about_path }

		it "should have the title 'Th Moov | About'" do
			page.should have_selector('title', text: 'Th Moov | About') 
		end

	end

	describe "Contact Page" do
		before { visit contact_path }

		it "should have the title 'Th Moov'" do
			page.should have_selector('title', text: 'Th Moov | Contact') 
		end

	end

	describe "Help Page" do
		before { visit help_path }

		it "should have the title 'Th Moov | About'" do
			page.should have_selector('title', text: 'Th Moov | Help') 
		end

	end

end
