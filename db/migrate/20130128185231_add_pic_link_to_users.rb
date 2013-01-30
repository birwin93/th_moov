class AddPicLinkToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :pic_link, :string
  end
end
