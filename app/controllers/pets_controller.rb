class PetsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def index
    @user = current_user
    @play_dates = current_user.play_dates
    if params[:query].present?
      @pets = Pet.all.pet_search(params[:query])
    else
      @pets = Pet.all
    end
  end

  def new
    @pet = Pet.new
  end

  def edit
    @user = current_user
    @pet = Pet.find(params[:id])
    return unless @pet[:user_id] != @user[:id]

    redirect_to pet_path(@pet)
  end

  def create
    @user = current_user
    @pet = Pet.new(pet_params)
    @pet.user = @user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @play_dates = current_user.play_dates.where(pet: @pet)
    @user = current_user
    @play_date = PlayDate.new
    @reviews = Review.all
  end

  private

  def pet_params
    params.require(:pet).permit(:pet_type, :name, :breed, :bio, :photo)
  end
end
