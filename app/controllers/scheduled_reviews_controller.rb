class ScheduledReviewsController < ApplicationController
	def index
		to_review = current_user.scheduled_reviews.where(scheduled_date: Date.today)
		to_review.each do |to_review|
			#@scheduled_review << current_user.flashcards.where(scheduled_review_id: to_review.id)
		end
	end
  def show
    @scheduled_review = current_user.scheduled_reviews.find(params[:id])
  end
end
