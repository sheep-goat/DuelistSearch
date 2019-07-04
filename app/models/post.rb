class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :prefecture
end
