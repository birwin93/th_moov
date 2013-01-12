# == Schema Information
#
# Table name: loop_event_shares
#
#  id         :integer          not null, primary key
#  loop_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LoopEventShare < ActiveRecord::Base
  attr_accessible :loop_id, :event_id

  belongs_to :loop
  belongs_to :event
end
