class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :schedule_date, presence: true
  validates :max_participant, numericality: { only_integer: true, greater_than: 0 }
end
