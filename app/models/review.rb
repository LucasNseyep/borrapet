class Review < ApplicationRecord
  belongs_to :users, through: :playdate
  belongs_to :pets, through: :playdate
end
