class PlayDate < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  has_many :reviews

  validates :start_time, :end_time, presence: true
  validates :start_time, :end_time, uniqueness: true
end
