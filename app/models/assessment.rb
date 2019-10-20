class Assessment < ApplicationRecord
  belongs_to :participator

  validates :participator_id, presence: true, uniqueness: true
  validates :grade, presence: true
end
