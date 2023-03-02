class PlayDate < ApplicationRecord
  # validate :available

  belongs_to :user
  belongs_to :pet

  has_one :review, dependent: :destroy

  validates :start_time, :end_time, presence: true
  validates :start_time, :end_time, uniqueness: true

  include PgSearch::Model
  pg_search_scope :playdate_search,
    against: [ :start_time, :end_time ],
    associated_against: {
      pet: [ :name, :bio ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
