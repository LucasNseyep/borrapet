class PlayDatesController < ApplicationController
  before_action :find_pet, only: [:create, :new]

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
    @play_dates = PlayDate.all
  end

  private

  def play_date_params
    params.require(:play_date).permit(:start_time, :end_time)
  end

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end
end