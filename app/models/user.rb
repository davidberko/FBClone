class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_one_attached :cover_photo
  has_many :posts

  def self.search(search)
    where("concat_ws(' ', first_name, last_name) ILIKE ?", "%#{search.squish}%") 
  end

  def full_name
    "#{first_name} " + "#{last_name}"
  end
end
