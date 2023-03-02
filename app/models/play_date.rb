class PlayDate < ApplicationRecord
  # validate :available

  belongs_to :user
  belongs_to :pet

  has_many :reviews, dependent: :destroy

  validates :start_time, :end_time, presence: true
  validates :start_time, :end_time, uniqueness: true

  validates :review, uniqueness: { scope: :pet }

  # def available
  #   # start_time = self.start_time
  #   # end_time = self.end_time
  #   # length = end_time - start_time
  #   # play_date = PlayDate.find(@pet[:id])
  #   if PlayDate.where('? < end_time and ? > start_time', self.start_time, self.end_time).any?
  #     errors.add(:end_time, "the pet will be on a play date then sorry!")
  #   end
  # end

  # private

  # def play_date_params
  #   params.require(:play_date).permit(:start_time, :end_time)
  # end

  # def find_pet
  #   @pet = Pet.find(:play_date[:pet_id.to_s.to_i])
  # end
end
