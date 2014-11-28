# == Schema Information
#
# Table name: flashcards
#
#  id                  :integer          not null, primary key
#  question            :string           not null
#  answer              :string           not null
#  difficulty          :decimal(, )      default("2.5")
#  user_id             :integer          not null
#  deck_id             :integer
#  scheduled_review_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  repetitions         :integer          default("0")
#  last_interval       :integer          default("0")
#
# Indexes
#
#  index_flashcards_on_deck_id              (deck_id)
#  index_flashcards_on_scheduled_review_id  (scheduled_review_id)
#  index_flashcards_on_user_id              (user_id)
#

class Flashcard < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  belongs_to :scheduled_review

  has_many :reviews

  validates :question, :answer, presence: true

  def calculate_next_review
    if score < 3
      self.repetitions = 0
      interval = 0
    else
      new_difficulty = calculate_difficulty(difficulty_to_f, score)

      if score == 3
        interval = 0
      else
        case repetitions
        when 1
          interval = 1
        when 2
          interval = 6
        else
          interval = self.last_interval * new_difficulty
        end
      end
    end

    self.scheduled_review = ScheduledReview.create(scheduled_date: Date.today + interval.to_i, user: User.first)
    self.last_interval = interval.to_i
  end

  def schedule_next_review(interval, current_user)
    scheduled_date = Date.today + interval
    future_review = current_user.scheduled_reviews.where(scheduled_date: scheduled_date).first

    if future_review
      future_review.flashcards << self
    else
      new_review = current_user.scheduled_reviews.create(scheduled_date: scheduled_date)
      new_review.flashcards << self
    end
  end

  private

  def difficulty_to_f
    difficulty.to_f
  end

  def score
    reviews.last.score
  end

  def calculate_difficulty(difficulty, score)
    s = score
    d_old = difficulty

    result = d_old - 0.8 + (0.28*s) - (0.028*s*s)
    result < 1.3 ? 1.3 : result
  end
end
