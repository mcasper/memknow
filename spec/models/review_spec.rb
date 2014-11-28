require "rails_helper"

RSpec.describe Review, type: :model do
  describe ".check_score" do
    it "removes the review's flashcard from the scheduled review if the score is 3 or higher" do
      user = FactoryGirl.build_stubbed(:user)
      scheduled_review = FactoryGirl.create(:scheduled_review, user: user)
      flashcard = FactoryGirl.create(:flashcard, user: user, scheduled_review: scheduled_review)
      review = FactoryGirl.create(:review, flashcard: flashcard, score: 3)

      expect(scheduled_review.flashcards.count).to eq(0)
    end
  end
end
