# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  firstName           :string(255)
#  lastName            :string(255)
#  email               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  password_digest     :string(255)
#  remember_token      :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  uid                 :integer
#  provider            :string(255)
#  oauth_token         :string(255)
#  oauth_expires_at    :datetime
#  name                :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :firstName, :lastName, :password, :password_confirmation, :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #has_secure_password



  has_many :loop_memberships
  has_many :loops, through: :loop_memberships

  has_many :event_memberships
  has_many :events, through: :event_memberships

  #validates :firstName, :lastName, :email, presence: true
  #validates :email, uniqueness: { case_sensitive: false }
  #validates :password, presence: true, length: { minimum: 6 }

  #before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_many :posts, as: :comment
  
  def full_name
  	"#{self.firstName} #{self.lastName}"
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  
  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
  
end
