class FlashcardsController < ApplicationController
  def index
    @flashcards = current_user.flashcards
  end

  def show
    @flashcard = current_user.flashcards.find(params[:id])
  end

  def new
    @flashcard = current_user.flashcards.new
  end

  def create
    @flashcard = current_user.flashcards.new(flashcard_params)

    if @flashcard.save
      create_or_add_to_scheduled_review(@flashcard)
      redirect_to user_path(current_user)
    else
      flash[:error] = "Please enter both a question AND an answer"
      redirect_to action: :new
    end
  end

  def update
    @flashcard = current_user.flashcards.find(params[:id])

    if @flashcard.update_attributes(flashcard_params)
      render :show
    else
      redirect_to action: :new
    end
  end

  def destroy
    @flashcard = current_user.flashcards.find(params[:id])
    @flashcard.destroy

    redirect_to :back
  end

  private

  def create_or_add_to_scheduled_review(flashcard)
    if current_user.scheduled_reviews.find_by(scheduled_date: Date.tomorrow)
      add_to_scheduled_review(flashcard)
    else
      create_scheduled_review
    end
  end

  def create_scheduled_review
    scheduled_review = current_user.scheduled_reviews.create(scheduled_date: Date.tomorrow)
    scheduled_review.flashcards << @flashcard
    ScheduledReviewEmailWorker.perform_at(scheduled_review.scheduled_time, scheduled_review.id)
  end

  def add_to_scheduled_review(flashcard)
    scheduled_review = current_user.scheduled_reviews.find_by(scheduled_date: Date.tomorrow)

    if scheduled_review.flashcards == []
      ScheduledReviewEmailWorker.perform_at(scheduled_review.scheduled_time, scheduled_review.id)
      scheduled_review.flashcards << flashcard
    else
      scheduled_review.flashcards << flashcard
    end
  end

  def flashcard_params
    params.require(:flashcard).permit(
      :question,
      :answer,
      :repetitions,
      :last_interval
    )
  end
end
