class AddFilePickerToLoops < ActiveRecord::Migration
  def change
  	add_column :loops, :filepicker_url, :string
  	add_column :events, :filepicker_url, :string
  end
end
