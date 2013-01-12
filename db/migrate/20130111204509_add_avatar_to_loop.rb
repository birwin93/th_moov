class AddAvatarToLoop < ActiveRecord::Migration
  def change
  	add_attachment :loops, :avatar
  end
end
