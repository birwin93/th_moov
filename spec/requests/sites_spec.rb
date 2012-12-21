require 'spec_helper'

describe "Site" do
	
	describe "Landing Page" do

		it "should have the title 'Th Moov'" do
			visit '/site/landing'
			page.should have_selector('title', text: 'Th Moov') 
		end

	end

	describe "About Page" do

		it "should have the title 'Th Moov | About'" do
			visit '/site/about'
			page.should have_selector('title', text: 'Th Moov | About') 
		end

	end

	describe "Contact Page" do

		it "should have the title 'Th Moov'" do
			visit '/site/contact'
			page.should have_selector('title', text: 'Th Moov | Contact') 
		end

	end

	describe "Help Page" do

		it "should have the title 'Th Moov | About'" do
			visit '/site/help'
			page.should have_selector('title', text: 'Th Moov | Help') 
		end

	end

end
