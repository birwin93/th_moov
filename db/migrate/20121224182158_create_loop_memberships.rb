class CreateLoopMemberships < ActiveRecord::Migration
  def change
    create_table :loop_memberships do |t|
      t.integer :user_id
      t.integer :loop_id
      t.string :status
      t.boolean :creator, default: false

      t.timestamps
    end
  end
end
