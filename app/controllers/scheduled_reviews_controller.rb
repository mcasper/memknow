class ScheduledReviewsController < ApplicationController
  def index
    @scheduled_reviews = current_user.scheduled_reviews
  end

  def show
    @scheduled_review = current_user.scheduled_reviews.find(params[:id])
    @reviews = @scheduled_review.flashcards
  end

  def next
    @scheduled_review = current_user.scheduled_review.where("id > ?", @scheduled_review.flashcard.id).first
  end

  def previous
  	@scheduled_review = @reviews.where("id < ?", @reviews.id).last
  end

end
