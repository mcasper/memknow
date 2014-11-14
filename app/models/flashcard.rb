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
#

class Flashcard < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  belongs_to :scheduled_review

  has_many :reviews

  validates :question, :answer, presence: true

  # Easiness factor between 1.3 and 2.5, 2.5 being the easiest and 1.3 most difficult

  def calculate_next_study
    if quality < 3
      self.repetitions = 0
      interval = 0
    else
      new_difficulty = calculate_difficulty(difficulty_to_f, quality)

      if quality == 3
        interval = 0
      else
        case self.repetitions
        when 1
          interval = 1
        when 2
          interval = 6
        else
          interval = interval * new_difficulty
        end
      end
    end

    scheduled_review = Date.today + interval
    interval
  end

  def difficulty_to_f
    difficulty.to_f
  end

  def repetitions
    reviews.count
  end

  def last_studied
    reviews.last.review_date
  end

  def quality
    reviews.last.quality
  end

  def calculate_difficulty(difficulty, quality)
    q = quality
    d_old = difficulty

    result = d_old - 0.8 + (0.28*q) - (0.028*q*q)
    result < 1.3 ? 1.3 : result
  end
end
