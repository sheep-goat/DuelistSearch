class Post < ApplicationRecord
  mount_uploader :image_path, PostImageUploader

  belongs_to :user
  belongs_to :game
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :participators, dependent: :delete_all
  has_many :users, through: :participators

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :schedule_date, presence: true
  validates :max_participant, numericality: { only_integer: true, greater_than: 0 }

  def self.latest_record
    Post.order(created_at: :desc)
  end
end
