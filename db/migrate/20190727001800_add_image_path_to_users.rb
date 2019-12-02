class AddImagePathToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_path, :string
  end
end
