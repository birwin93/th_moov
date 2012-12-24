# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  firstName       :string(255)
#  lastName        :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
  before do 
  	@user = User.new(firstName: "Billy", lastName: "Irwin",
  									 email: "birwin93@gmail.com", password: "password",
  									 password_confirmation: "password");
  end

  subject { @user }

  it { should respond_to(:firstName) }
  it { should respond_to(:lastName) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

  describe "when first name is not present" do
  	before { @user.firstName = "" }
  	it { should_not be_valid }
  end

  describe "when last name is not present" do
  	before { @user.lastName = "" }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = "" }
  	it { should_not be_valid }
  end

  describe "when email address is already taken" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end
  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before { @user.password = @user.password_confirmation = "" }
  	it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do 
  	before { @user.save }
  	let(:found_user) { User.find_by_email (@user.email) }

  	describe "with valid password" do
  		it { should == found_user.authenticate(@user.password) }
  	end

  	describe "with valid password" do
  		let(:user_for_invalid_password) { found_user.authenticate("invalid") }
  		it { should_not == user_for_invalid_password }
  	end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

end
