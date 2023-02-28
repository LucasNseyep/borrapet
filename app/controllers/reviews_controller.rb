class ReviewsController < ApplicationController
  before_action :find_play_date, only: %i[create new]

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
    if @review.save
      redirect_to user_play_dates_path(@user)
    else
      render :new, status: :unprocessable_entity
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
