class AddEventUrlToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :actual_url, :string
  end
end
