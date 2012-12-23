FactoryGirl.define do
	factory :user do
		firstName  "Billy"
		lastName   "Irwin"
		email      "birwin93@gmail.com"
		password   "password"
		password_confirmation "password"
	end
end