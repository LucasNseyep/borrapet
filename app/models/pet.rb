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
    array = self.reviews.pluck(:rating)
    if array.size == 0
      return 0
    else
      return array.sum / array.size
    end
  end

  # def available?
  #   # start_time = self.start_time
  #   # end_time = self.end_time
  #   # length = end_time - start_time
  #   if PlayDate.where('? < end_time and ? > start_time', self.start_time, self.end_time).any?
  #     errors.add(:end_time, "the pet will be on a play date then sorry!")
  #   end
  # end
end
