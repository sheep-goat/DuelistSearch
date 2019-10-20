class ChangeGradeToAssessments < ActiveRecord::Migration[5.2]
  def change
    change_column :assessments, :grade, :string
  end
end
