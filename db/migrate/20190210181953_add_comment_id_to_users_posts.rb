class AddCommentIdToUsersPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts_users, :comment_id, :integer 
  end
end
