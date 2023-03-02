class PlayDatesController < ApplicationController
  before_action :find_pet, only: [:create, :new]
  # before_action :find_review, only: [:index]

  def new
    @play_date = PlayDate.new
  end

  def create
    @user = current_user
    @play_date = PlayDate.new(play_date_params)
    @play_date.user = @user
    @play_date.pet = @pet
    if @play_date.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @play_dates = current_user.play_dates
    # @play_dates = PlayDate.all
    # @play_dates.select(params[:user_id].to_i)
    # @reviews = Review.all
    # @reviews.select(params[:play_date_id].to_i)
  end

  private

  def play_date_params
    params.require(:play_date).permit(:start_time, :end_time)
  end

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  # def find_review
  #   @review = Review.find(params[:id])
  # end
end
