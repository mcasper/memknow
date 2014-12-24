# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  score        :integer
#  review_date  :date
#  flashcard_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :flashcard

  validates :flashcard, presence: true

  after_create :set_repetitions, :check_score

  def set_repetitions
    flashcard.repetitions += 1
  end

  def check_score
    if score >= 3
      if flashcard.scheduled_review.flashcards == [flashcard]
        flashcard.scheduled_review.destroy
      else
        flashcard.scheduled_review.flashcards.delete(flashcard)
      end
    end
  end
end
