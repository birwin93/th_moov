# == Schema Information
#
# Table name: event_memberships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#  author_id  :integer
#

class EventMembership < ActiveRecord::Base
	attr_accessible :author_id, :event_id
	
  belongs_to :user
  belongs_to :author, class_name: "User"
  belongs_to :event

  def is_author?(id)
  	self.author_id == id
  end

end
