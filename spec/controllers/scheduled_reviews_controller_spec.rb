require "rails_helper"

RSpec.describe ScheduledReviewsController, type: :controller do
  before do
    @user = setup_user
    authenticate(@user)
  end

  describe "GET #show" do
    it "returns the scheduled review for today" do
      flashcard = FactoryGirl.create(:flashcard, user: @user)
      scheduled_review = FactoryGirl.create(:scheduled_review, scheduled_date: Date.today, user: @user)
      scheduled_review2 = FactoryGirl.create(:scheduled_review, scheduled_date: Date.tomorrow, user: @user)

      get :show, id: @user.scheduled_reviews.where(scheduled_date: Date.today).first.id

      expect(assigns(:scheduled_review)).to eq(scheduled_review)
    end
  end
end
