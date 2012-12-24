# == Schema Information
#
# Table name: loops
#
#  id          :integer          not null, primary key
#  privacy     :string(255)
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Loop < ActiveRecord::Base
  attr_accessible :description, :name, :privacy

  validates :name, :privacy, presence: true

  has_many :loop_memberships
  has_many :users, through: :loop_memberships
end
