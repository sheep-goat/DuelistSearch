class Assessment < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :grade, presence: true

  scope :count_grade, -> { group(:grade).count(:grade) }

  def self.join?(post_id)
    participator = Participator.where(user_id: current_user.id).where(post_id: post_id)
    return true if participator.present?
    return false
  end
end
