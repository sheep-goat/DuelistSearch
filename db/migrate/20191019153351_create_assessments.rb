class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.references :participator, foreign_key: true , null: false
      t.integer :grade, null: false
      t.string :comment

      t.timestamps
    end
  end
end
