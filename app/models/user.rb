class User < ApplicationRecord
  has_many :play_dates, through: :pets
  has_many :reviews, through: :playdate, dependent: :destroy
  has_many :pets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
