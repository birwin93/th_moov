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
#  date                :datetime
#  location_id         :integer
#  type                :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :description, :name, :avatar, :tag_list, :date, :isVenue, :filepicker_url, :location

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_many :event_memberships
  has_many :users, through: :event_memberships

  has_many :loop_event_shares
  has_many :loops, through: :loop_event_shares

  has_many :posts, as: :comment

  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :location
  belongs_to :organization

  validates :name, presence: true

  scope :open, where("isVenue = ?", "open")

  def self.tagged_with(name)
    Tag.where(name: name).first_or_create.events
  end

  def tag_list
  	tags.map(&:name).join(", ")
  end

  def tag_list=(names)
  	self.tags = names.split(", ").map do |n|
  		Tag.where(name: n.strip).first_or_create!
  	end
  end

  def location=(city)
    self.location_id = Location.find_or_create_by_city(city).id
  end

  
end
