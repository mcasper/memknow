require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "POST #create" do
    it "creates a review" do
      flashcard = FactoryGirl.create(:flashcard, user: user)
      post :create, { flashcard_id: flashcard.id, review: { proposed_answer: "My correct answer", quality: 4, flashcard: flashcard } }, { user_id: user.id }

      expect(assigns(:review).proposed_answer).to eq("My correct answer")
    end
  end
end
