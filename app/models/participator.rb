class Participator < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :assessment
end
