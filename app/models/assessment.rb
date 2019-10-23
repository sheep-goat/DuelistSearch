class Assessment < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :grade, presence: true
end
