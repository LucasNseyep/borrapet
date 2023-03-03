class PlayDatesController < ApplicationController
  before_action :find_pet, only: %i[create new]
  # before_action :find_review, only: [:index]

  def new
    @play_date = PlayDate.new
  end

  def create
    @user = current_user
    @all_play_dates = PlayDate.all
    @play_date = PlayDate.new(play_date_params)
    @play_date.user = @user
    @play_date.pet = @pet

    @start_time = @play_date.start_time
    @end_time = @play_date.end_time
    found = false

    @all_play_dates.each do |date|
      starts = date.start_time
      ends = date.end_time
      next unless @start_time.between?(starts, ends) || @end_time.between?(starts, ends)

      found = true if date.pet_id == @play_date.pet_id
    end

    if found == true
      redirect_to pet_path(@pet), notice: "Sorry this pet is booked between these times"
    else
      @play_date.save
      redirect_to pet_path(@pet)
    end
  end

  def index
    @play_dates = current_user.play_dates
  end

  private

  def play_date_params
    params.require(:play_date).permit(:start_time, :end_time)
  end

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end
end
