class ScheduledReviewsController < ApplicationController
  def index
    @scheduled_reviews = current_user.scheduled_reviews
  end

  def show
  	if flashcards_count == 0
  		redirect_to scheduled_reviews_path
  	else
    	@scheduled_review = current_user.scheduled_reviews.find(params[:id])
    	@reviews = @scheduled_review.flashcards
    end
  end
end
