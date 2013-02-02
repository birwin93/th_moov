# == Schema Information
#
# Table name: locate_tags
#
#  id          :integer          not null, primary key
#  location_id :integer
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocateTag < ActiveRecord::Base
  attr_accessible :event_id, :location_id

  belongs_to :location
  belongs_to :event
  
end
