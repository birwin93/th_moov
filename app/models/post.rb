# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  content      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  comment_id   :integer
#  comment_type :string(255)
#

class Post < ActiveRecord::Base
  attr_accessible :user_id, :content

  belongs_to :comment, :polymorphic => true

  belongs_to :user


end
