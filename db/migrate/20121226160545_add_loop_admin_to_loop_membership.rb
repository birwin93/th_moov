class AddLoopAdminToLoopMembership < ActiveRecord::Migration
  def change
  	add_column :loop_memberships, :admin, :boolean, default: false
  end
end
