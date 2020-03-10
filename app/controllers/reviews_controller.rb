class ReviewsController < ApplicationController
  before_action :set_booking, only: [ :new, :create ]

  def new
    @review = Review.new
    @review.offer = @offer
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.offer = Offer.find(params[:offer_id])
    @review.save
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:star, :content)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
