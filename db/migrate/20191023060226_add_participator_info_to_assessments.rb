class AddParticipatorInfoToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assessments, :user, foreign_key: true
    add_reference :assessments, :post, foreign_key: true
  end
end
