# == Schema Information
#
# Table name: flashcards
#
#  id                  :integer          not null, primary key
#  question            :string           not null
#  answer              :string           not null
#  user_id             :integer
#  deck_id             :integer
#  scheduled_review_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Flashcard < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  belongs_to :scheduled_review

  validates :question, :answer, presence: true
end
