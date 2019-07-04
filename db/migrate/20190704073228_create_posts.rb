class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title
      t.references :game, foreign_key: true, null: false
      t.datetime :schedule_date
      t.references :prefecture, foreign_key: true
      t.string :location
      t.integer :max_participant
      t.text :desc

      t.timestamps
    end
  end
end
