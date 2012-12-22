require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "signup page" do 
		before { visit signup_path }
		it { should have_selector('title', text: 'Th Moov | Signup') }
	end
	
end
