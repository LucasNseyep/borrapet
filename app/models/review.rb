class Review < ApplicationRecord
  belongs_to :play_date

  validates :rating, presence: true
end
