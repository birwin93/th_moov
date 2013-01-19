class AddCommentToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :comment_id, :integer
  	add_column :posts, :comment_type, :string
  end
end
