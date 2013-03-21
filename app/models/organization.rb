# == Schema Information
#
# Table name: organizations
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Organization < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token

  before_save :create_remember_token

  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  before_save { |user| user.email = email.downcase }

  has_many :events

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
