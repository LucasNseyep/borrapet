class Pet < ApplicationRecord
  # validate :available?

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
    return 0 if array.size == 0

    return array.sum / array.size
  end

  include PgSearch::Model
  pg_search_scope :pet_search,
                  against: %i[name pet_type bio],
                  associated_against: {
                    user: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
