class CreateLoops < ActiveRecord::Migration
  def change
    create_table :loops do |t|
      t.string :privacy
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
