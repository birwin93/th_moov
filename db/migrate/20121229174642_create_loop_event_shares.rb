class CreateLoopEventShares < ActiveRecord::Migration
  def change
    create_table :loop_event_shares do |t|
    	t.integer :loop_id
    	t.integer :event_id
      t.timestamps
    end

    add_index :loop_event_shares, :loop_id
    add_index :loop_event_shares, :event_id
    add_index :loop_event_shares, [:loop_id, :event_id], unique: true
  end
end
