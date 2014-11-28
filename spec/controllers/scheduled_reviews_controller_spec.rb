require "rails_helper"

RSpec.describe ScheduledReviewsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:scheduled_review) { FactoryGirl.create(:scheduled_review, scheduled_date: Date.today, user: user) }

  describe "GET #index" do
    it "returns the scheduled reviews for the user" do
      scheduled_review
      get :index, {}, { user_id: user.id }

      expect(assigns(:scheduled_reviews)).to eq([scheduled_review])
    end
  end

  describe "GET #show" do
    it "returns the scheduled review and flashcards for today" do
      scheduled_review2 = FactoryGirl.create(:scheduled_review, scheduled_date: Date.tomorrow, user: user)
      flashcard = FactoryGirl.create(:flashcard, user: user, scheduled_review: scheduled_review)

      get :show, { id: user.scheduled_reviews.where(scheduled_date: Date.today).first.id }, { user_id: user.id }

      expect(assigns(:scheduled_review)).to eq(scheduled_review)
      expect(assigns(:reviews)).to eq([flashcard])
    end
  end
end
