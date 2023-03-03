class PlayDate < ApplicationRecord
  # validate :available

  belongs_to :user
  belongs_to :pet

  has_one :review, dependent: :destroy

  validates :start_time, :end_time, presence: true
  validates :start_time, :end_time, uniqueness: true

  include PgSearch::Model
  pg_search_scope :playdate_search,
                  against: %i[start_time end_time],
                  associated_against: {
                    pet: %i[name bio pet_type user_id]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
