class User < ApplicationRecord
  has_secure_password validations: true
  has_one_attached :image

  has_many :posts
  has_many :favorites
  has_many :comments
  has_many :fav_posts, through: :favorites, source: :post

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  VALID_USERNAME_REGEX = /\A[a-zA-Z_][a-zA-Z0-9_]+\z/

  validates :username, presence: true, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 20 }
  validates :username, format: { with: VALID_USERNAME_REGEX }
  validates :nickname, presence: true
  validates :nickname, length: { minimum: 1, maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  validates :password_digest, presence: true
end
