# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :event_memberships
  has_many :users, through: :event_memberships

  has_many :loop_event_shares
  has_many :loops, through: :loop_event_shares
  
end
