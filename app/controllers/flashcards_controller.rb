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
      create_scheduled_review
      render :show
    else
      redirect_to :new
    end
  end

  def update
    @flashcard = current_user.flashcards.find(params[:id])

    if @flashcard.update_attributes(flashcard_params)
      render :show
    else
      redirect_to :new
    end
  end

  def destroy
    @flashcard = current_user.flashcards.find(params[:id])
    @flashcard.destroy

    head :ok
  end

  private

  def create_scheduled_review
    scheduled_review = current_user.scheduled_reviews.create(scheduled_date: Date.today)
    @flashcard.update_attributes(scheduled_review: scheduled_review)
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
