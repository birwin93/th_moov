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
