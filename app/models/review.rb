# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  proposed_answer :string
#  quality         :integer
#  review_date     :date
#  flashcard_id    :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :flashcard

  validates :flashcard, presence: true

  after_create :set_repetitions

  def set_repetitions
    flashcard.repetitions += 1
  end
end
