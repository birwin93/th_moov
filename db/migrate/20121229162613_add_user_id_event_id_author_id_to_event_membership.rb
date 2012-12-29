class AddUserIdEventIdAuthorIdToEventMembership < ActiveRecord::Migration
  def change
  	add_column :event_memberships, :event_id, :integer
  	add_column :event_memberships, :user_id, :integer
  	add_column :event_memberships, :author_id, :integer

  	add_index :event_memberships, :event_id
  	add_index :event_memberships, :user_id
  	add_index :event_memberships, [:user_id, :event_id], unique: true
  end
end
