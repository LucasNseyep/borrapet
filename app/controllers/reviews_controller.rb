class ReviewsController < ApplicationController
  before_action :find_play_date, only: [:create, :new]

  def index
    @reviews = Review.all
    # @play_dates = PlayDate.all
    @user = current_user
    @reviews.select(params[:user_id].to_i)
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.play_date_id = @play_date.id
    # play_dates = PlayDate.all
    # filters = play_dates.select { |date| date.user == @user }
    # # filters.each do |filter|
    # #   filter.id != @review.play_date_id
    # # end
    # raise
    if @review.save
      redirect_to pet_path(@play_date[:pet_id])
    else
      # render :new, status: :unprocessable_entity
      redirect_to pet_path(@play_date[:pet_id])
    end
  end

  def new
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_play_date
    @play_date = PlayDate.find(params[:play_date_id])
  end
end
