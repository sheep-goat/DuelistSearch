class RemoveParticipatorToAssessments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assessments, :participator_id
  end
end
