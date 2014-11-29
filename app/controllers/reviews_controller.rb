class ReviewsController < ApplicationController
  def create
    @review = current_flashcard.reviews.new(review_params.merge(review_date: Date.today))

    if @review.save
      interval = @review.flashcard.calculate_next_review
      @review.flashcard.schedule_next_review(interval, current_user)

      head :ok
    else
      render :new
    end
  end

  private

  def current_flashcard
    current_user.flashcards.find(params[:flashcard_id])
  end

  def review_params
    params.require(:review).permit(:score)
  end
end
