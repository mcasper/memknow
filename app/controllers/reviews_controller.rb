class ReviewsController < ApplicationController
  def create
    @review = current_flashcard.reviews.new(review_date: Date.today, score: submitted_score)

    if @review.save
      interval = @review.flashcard.calculate_next_review
      @review.flashcard.schedule_next_review(interval, current_user)

      if @review.flashcard.try(:scheduled_review)
        redirect_to :back
      else
        redirect_to scheduled_reviews_path
      end
    else
      render :new
    end
  end

  private

  def submitted_score
    case params[:commit]
    when ":("
      1
    when "Ehhh"
      2
    when "Not bad"
      3
    when "Aced"
      4
    end
  end

  def current_flashcard
    current_user.flashcards.find(params[:flashcard_id])
  end
end
