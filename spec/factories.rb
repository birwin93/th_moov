FactoryGirl.define do
	factory :user do
		firstName  "Billy"
		lastName   "Irwin"
		email      "birwin93@gmail.com"
		password   "password"
		password_confirmation "password"
	end

	factory :thmoov_loop, class: 'Loop' do
		name "Th Moov"
		privacy "open"
		description "A startup formed by 6 UofM Students."
	end

	factory :chiphi_loop, class: 'Loop' do
		name "Chi Phi"
		privacy "open"
		description "A frat. We Rage."
	end

end