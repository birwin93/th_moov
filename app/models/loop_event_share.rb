class LoopEventShare < ActiveRecord::Base
  attr_accessible :loop_id, :event_id

  belongs_to :loop
  belongs_to :event
end
