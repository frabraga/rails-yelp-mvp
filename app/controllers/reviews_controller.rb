class ReviewsController < ApplicationController

  def new
    @restaurant = set_review
    @review = Review.new
  end

  def create
    @review = Review.new(review_param)
    @review.restaurant = set_review
    if @review.save
      redirect_to restaurant_path(set_review)
    else
      render :new
    end
  end

  private

  def review_param
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    Restaurant.find(params[:restaurant_id])
  end
end
