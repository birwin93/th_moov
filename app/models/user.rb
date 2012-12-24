# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  firstName  :string(255)
#  lastName   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :firstName, :lastName, :password, :password_confirmation
  has_secure_password

  validates :firstName, :lastName, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  def full_name
  	"#{self.firstName} #{self.lastName}"
  end

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
  
end
