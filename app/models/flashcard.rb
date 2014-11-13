# == Schema Information
#
# Table name: flashcards
#
#  id                  :integer          not null, primary key
#  question            :string           not null
#  answer              :string           not null
#  difficulty          :integer
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

  # Easiness factor between 1.3 and 2.5, 2.5 being the easiest and 1.3 most difficult
  #
  #
  validates :question, :answer, presence: true

  def calculate_next_study(quality)
  end

  def repetitions
    reviews.count
  end

  def last_studied
    reviews.last.review_date
  end
end
