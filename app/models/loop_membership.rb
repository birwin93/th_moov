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
#  admin      :boolean          default(FALSE)
#  author_id  :integer
#

class LoopMembership < ActiveRecord::Base
  attr_accessible :creator, :loop_id, :author_id, :status

  validates :loop_id, :user_id, :status, presence: true

  scope :pending, where("status = ?", "pending")

  belongs_to :loop
  belongs_to :user
  belongs_to :author, class_name: "User"

  before_validation { |lm| lm.status = "pending" if lm.new_record? }

  def accept! 
  	self.update_attributes(status: "accepted")
  end

  def decline!
  	self.update_attributes(status: "decline")
  end

  def makeAdmin!
  	self.update_attributes(admin: "true")
  end

  def removeAdmin!
  	self.update_attributes(admin: "false")
  end


end
