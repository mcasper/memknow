require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  login_user

  describe "POST #create" do
    it "creates a review" do
      flashcard = FactoryGirl.create(:flashcard, user: User.first)
      post :create, flashcard_id: flashcard.id, review: { proposed_answer: "My correct answer", quality: 4, flashcard: flashcard }

      expect(assigns(:review).proposed_answer).to eq("My correct answer")
    end
  end
end
