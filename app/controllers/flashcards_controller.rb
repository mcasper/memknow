class FlashcardsController < ApplicationController
  def show
    @flashcard = current_user.flashcards.find(params[:id])
  end

  def new
    @flashcard = current_user.flashcards.new
  end

  def create
    @flashcard = current_user.flashcards.new(flashcard_params)

    if @flashcard.save
      render :show
    else
      render :json, { errors: @flashcard.errors }, status: :unprocessible_entity
    end
  end

  def update
    @flashcard = current_user.flashcards.find(params[:id])

    if @flashcard.update_attributes(flashcard_params)
      render :show
    else
      render :json, { errors: @flashcard.errors }, status: :unprocessible_entity
    end
  end

  def destroy
    @flashcard = current_user.flashcards.find(params[:id])
    @flashcard.destroy

    head :ok
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(
      :question,
      :answer,
      :repetitions,
      :last_interval
    )
  end
end
