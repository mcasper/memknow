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

    head :ok
  end

  private

  def create_or_add_to_scheduled_review(flashcard)
    if current_scheduled_review
      add_to_scheduled_review(flashcard)
    else
      create_scheduled_review
    end
  end

  def create_scheduled_review
    scheduled_review = current_user.scheduled_reviews.create(scheduled_date: Date.today)
    scheduled_review.flashcards << @flashcard
  end

  def add_to_scheduled_review(flashcard)
    current_scheduled_review.flashcards << flashcard
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
