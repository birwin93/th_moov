class LocateTag < ActiveRecord::Base
  attr_accessible :event_id, :location_id

  belongs_to :location
  belongs_to :event
  
end
