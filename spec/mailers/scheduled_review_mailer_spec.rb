require "rails_helper"

RSpec.describe ScheduledReviewMailer, type: :mailer do
  describe "new_review_scheduled" do
    let(:user) { FactoryGirl.create(:user) }
    let(:scheduled_review) { FactoryGirl.create(:scheduled_review, scheduled_date: Date.today, user: user) }
    let(:mail) { ScheduledReviewMailer.new_review_scheduled(scheduled_review) }

    it "renders the headers" do
      expect(mail.subject).to eq("Stop! Study time")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["study@memknow.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hey smartypants")
    end
  end
end
