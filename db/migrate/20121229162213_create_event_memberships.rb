class CreateEventMemberships < ActiveRecord::Migration
  def change
    create_table :event_memberships do |t|
     
      t.timestamps
    end
  end
end
