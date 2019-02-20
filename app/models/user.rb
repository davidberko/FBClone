class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_one_attached :cover_photo
  has_many :posts

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :friend_requests
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_and_belongs_to_many :likes, join_table: :posts_users, association_foreign_key: :post_id, class_name: "Post"
  has_and_belongs_to_many :likes, join_table: :posts_users, association_foreign_key: :comment_id, class_name: "Comment"

  def self.search(search)
    where("concat_ws(' ', first_name, last_name) ILIKE ?", "%#{search.squish}%")
  end

  def full_name
    "#{first_name} " + "#{last_name}"
  end
  def remove_friend(friend)
    self.friends.destroy(friend)
  end

  def friends?(friend)
     self.friends.includes(friend)
  end

  def gender
    if self.female == true
      print = "her"
    else
      print = "his"
    end
  end
end
