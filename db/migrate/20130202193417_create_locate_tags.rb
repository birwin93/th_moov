class CreateLocateTags < ActiveRecord::Migration
  def change
    create_table :locate_tags do |t|
      t.integer :location_id
      t.integer :event_id

      t.timestamps
    end
  end
end
