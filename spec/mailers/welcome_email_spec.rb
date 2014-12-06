require "rails_helper"

RSpec.describe ScheduledReviewMailer, type: :mailer do
  describe "new_review_scheduled" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { WelcomeEmail.welcome(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("You + Memknow = Genius")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["study@memknow.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("You signed up for Memknow.")
    end
  end
end
