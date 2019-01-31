class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_one_attached :cover_photo

  def self.search(search)
    where("first_name ILIKE ?", "%#{search}%")
    where("last_name ILIKE ?", "%#{search}%")
  end

  def full_name
    "#{first_name} " + "#{last_name}"
  end
end
