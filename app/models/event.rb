# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Event < ActiveRecord::Base
  attr_accessible :description, :name, :avatar

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_many :event_memberships
  has_many :users, through: :event_memberships

  has_many :loop_event_shares
  has_many :loops, through: :loop_event_shares

  has_many :posts, as: :comment
  
end
