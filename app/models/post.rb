class Post < ActiveRecord::Base
  attr_accessible :user_id, :content

  belongs_to :comment, :polymorphic => true

  belongs_to :user


end
