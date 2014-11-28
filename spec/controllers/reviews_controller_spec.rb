require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "POST #create" do
    it "creates a review" do
      scheduled_review = FactoryGirl.create(:scheduled_review, user: user)
      flashcard = FactoryGirl.create(:flashcard, user: user, scheduled_review: scheduled_review)
      post :create, { flashcard_id: flashcard.id, review: { score: 4, flashcard: flashcard } }, { user_id: user.id }

      expect(assigns(:review).score).to eq(4)
    end
  end
end
