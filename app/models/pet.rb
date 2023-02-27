class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :breed, presence: true
  validates :pet_type, presence: true
  validates :bio, presence: true
  # validates :photo
end
