# == Schema Information
#
# Table name: loops
#
#  id                  :integer          not null, primary key
#  privacy             :string(255)
#  name                :string(255)
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Loop < ActiveRecord::Base
  attr_accessible :description, :name, :privacy, :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :loop => "150x150>" }

  validates :name, :privacy, presence: true

  has_many :loop_memberships
  has_many :users, through: :loop_memberships

  has_many :loop_event_shares
  has_many :events, through: :loop_event_shares

  has_many :posts, as: :comment
end
