class PetsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def index
    @user = current_user
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
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
    @user = current_user
  end

  private

  def pet_params
    params.require(:pet).permit(:pet_type, :name, :breed, :bio)
  end

end
