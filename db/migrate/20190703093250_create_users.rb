class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :nickname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :age, null: false
      t.string :gender, null: false
      t.string :area
      t.string :profile

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
