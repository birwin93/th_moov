class AddAuthorIdToLoopMemberships < ActiveRecord::Migration
  def change
  	add_column :loop_memberships, :author_id, :integer
  end
end
