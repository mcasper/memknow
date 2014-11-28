class ScheduledReviewsController < ApplicationController
  def index
    @scheduled_reviews = current_user.scheduled_reviews
  end

  def show
    @scheduled_review = current_user.scheduled_reviews.find(params[:id])
    @reviews = @scheduled_review.flashcards
  end
end
