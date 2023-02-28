class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @play_dates = PlayDate.all
    @user = current_user
  end

  def create
  end

  def new
    @review = Review.new
  end
end
