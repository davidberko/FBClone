class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_and_belongs_to_many :likes, join_table: :posts_users, association_foreign_key: :user_id, class_name: "User"
end
