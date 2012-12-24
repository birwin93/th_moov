class AddIndexToLoopMembership < ActiveRecord::Migration
  def change
  	add_index :loop_memberships, :loop_id
  	add_index :loop_memberships, :user_id
  	add_index :loop_memberships, [:user_id, :loop_id], unique: true
  end
end
