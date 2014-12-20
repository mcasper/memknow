require "rails_helper"

RSpec.describe WelcomeEmail, type: :service do
  describe ".message" do
    let(:user) { FactoryGirl.create(:user) }
    let(:scheduled_review) { FactoryGirl.create(:scheduled_review, scheduled_date: Date.today, user: user) }

    it "returns an email body" do
      expect(ScheduledReviewEmail.new(scheduled_review).message).to include("Stop!")
    end

    it "sends and email" do
      email = JSON.parse(ScheduledReviewEmail.new(scheduled_review).next_review)
      expect(email["message"]).to eq("Queued. Thank you.")
    end
  end
end
