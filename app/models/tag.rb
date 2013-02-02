class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :events, through: :taggings

  before_save :downcase_tag_name

  private 
  	def downcase_tag_name
  		name.downcase!
  	end
  
end
