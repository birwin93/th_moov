class ChangeTypeInEvents < ActiveRecord::Migration
  def up
  	rename_column :events, :type, :isVenue
  end

  def down
  	rename_column :events, :isVenue, :type
  end
end
