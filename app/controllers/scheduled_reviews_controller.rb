class ScheduledReviewsController < ApplicationController
  def show
    @scheduled_review = current_user.scheduled_reviews.find(params[:id])
  end
end
