class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :user, polymorphic: true
      t.references :friend, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
