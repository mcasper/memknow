require "rails_helper"

RSpec.describe Flashcard do
  describe ".calculate_next_study" do
    it "calculates the interval until the next study session" do
      flashcard = FactoryGirl.create(:flashcard)
      review = FactoryGirl.create(:review, flashcard: flashcard, quality: 4)

      expect(flashcard.calculate_next_study).to eq(1)
    end
  end
end
