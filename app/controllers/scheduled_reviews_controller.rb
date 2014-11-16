class ScheduledReviewsController < ApplicationController
  def show
    @scheduled_review = current_user.scheduled_reviews.where(scheduled_date: Date.today).first
  end
end
