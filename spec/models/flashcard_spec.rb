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

require "rails_helper"

RSpec.describe Flashcard do
  let(:user) { FactoryGirl.create(:user) }

  describe ".calculate_next_review" do
    it "returns 1 for the first interval" do
      flashcard = FactoryGirl.create(:flashcard, user: user)
      review = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)

      expect(flashcard.calculate_next_review).to eq(1)
    end

    it "returns 6 for the second interval" do
      flashcard = FactoryGirl.create(:flashcard, user: user)
      review = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)
      review2 = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)

      expect(flashcard.calculate_next_review).to eq(6)
    end

    it "returns 14 for the third interval" do
      flashcard = FactoryGirl.create(:flashcard, user: user)
      review = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)
      flashcard.calculate_next_review
      review2 = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)
      flashcard.calculate_next_review
      review3 = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)

      expect(flashcard.calculate_next_review).to eq(14)
    end

    it "returns 0 for quality scores lower than 4" do
      flashcard = FactoryGirl.create(:flashcard, user: user)
      review = FactoryGirl.create(:review, flashcard: flashcard, quality: 3)

      expect(flashcard.calculate_next_review).to eq(0)
    end

    it "creates a scheduled review based on the calculated interval" do
      flashcard = FactoryGirl.create(:flashcard, user: user)
      review = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)
      review2 = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)
      flashcard.calculate_next_review

      expect(ScheduledReview.last.scheduled_date).to eq(Date.today + 6)
    end
  end
end
