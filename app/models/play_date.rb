class PlayDate < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  has_many :reviews, dependent: :destroy
end
