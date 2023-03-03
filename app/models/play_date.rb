class PlayDate < ApplicationRecord
  # validate :available

  belongs_to :user
  belongs_to :pet

  has_one :review, dependent: :destroy

  validates :start_time, :end_time, presence: true
  validates :start_time, :end_time, uniqueness: true
end
