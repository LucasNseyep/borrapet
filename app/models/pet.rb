class Pet < ApplicationRecord
  belongs_to :user
  has_many :play_dates, dependent: :destroy
  has_many :reviews, through: :play_dates
  has_one_attached :photo

  validates :name, presence: true
  validates :breed, presence: true
  validates :pet_type, presence: true
  validates :bio, presence: true
  # validates :photo, presence: true

  def average
    array = reviews.pluck(:rating)
    return 0 if array.empty?

    array.sum / array.size
  end
end
