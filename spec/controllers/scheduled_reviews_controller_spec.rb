require "rails_helper"

RSpec.describe ScheduledReviewsController, type: :controller do
  login_user

  describe "GET #show" do
    it "returns the scheduled review for today" do
      flashcard = FactoryGirl.create(:flashcard, user: User.first)
      scheduled_review = FactoryGirl.create(:scheduled_review, scheduled_date: Date.today, user: User.first)
      scheduled_review2 = FactoryGirl.create(:scheduled_review, scheduled_date: Date.tomorrow, user: User.first)

      get :show, id: User.first.scheduled_reviews.where(scheduled_date: Date.today).first.id

      expect(assigns(:scheduled_review)).to eq(scheduled_review)
    end
  end
end
