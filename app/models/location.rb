# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  state      :string(255)
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :address, :city, :latitude, :longitude, :state
  validates :city, presence: true, uniqueness: true
  has_many :events

  geocoded_by :city
  reverse_geocoded_by :latitude, :longitude do |obj,results|
  	if geo = results.first
   	 obj.city    = geo.city
   	 obj.state = geo.state
  	end
	end

  before_validation :geocode
  after_validation :reverse_geocode

  def self.find_by_ip(ip)
  	Geocoder.search(ip)
  end



end
