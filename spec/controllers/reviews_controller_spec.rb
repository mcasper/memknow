require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  before do
    @user = setup_user
    authenticate(@user)
  end

  describe "POST #create" do
    it "creates a review" do
      flashcard = FactoryGirl.create(:flashcard, user: @user)
      post :create, flashcard_id: flashcard.id, review: { proposed_answer: "My correct answer", quality: 4, flashcard: flashcard }

      expect(assigns(:review).proposed_answer).to eq("My correct answer")
    end
  end
end
