# == Schema Information
#
# Table name: loop_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  loop_id    :integer
#  status     :string(255)
#  creator    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LoopMembership < ActiveRecord::Base
  attr_accessible :creator, :loop_id

  validates :loop_id, :user_id, :status, presence: true

  belongs_to :loop
  belongs_to :user

  before_validation { |lm| lm.status = "pending" if lm.new_record? }

  def accept! 
  	self.status = "accepted"
  end

  def decline!
  	self.status = "decline"
  end


end
