class User < ApplicationRecord
  has_secure_password
  mount_uploader :image_path, UserImageUploader

  has_many :posts
  has_many :favorites
  has_many :comments
  has_many :fav_posts, through: :favorites, source: :post
  has_many :participators
  has_many :assessments
  has_many :posts, through: :participators
  has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships
  has_many :followers, through: :passive_relationships

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  VALID_USERNAME_REGEX = /\A[a-zA-Z_][a-zA-Z0-9_]+\z/

  validates :username, presence: true, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 20 }
  validates :username, format: { with: VALID_USERNAME_REGEX }
  validates :nickname, presence: true
  validates :nickname, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }, confirmation: true, on: :create
  validates :area, length: { maximum: 20 }
  validates :profile, length: { maximum: 254 }

  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
