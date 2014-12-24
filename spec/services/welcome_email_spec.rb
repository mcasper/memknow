require "rails_helper"

RSpec.describe WelcomeEmail, type: :service do
  describe ".message" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns an email body" do
      expect(WelcomeEmail.new(user).message).to include("Hey there!")
    end

    xit "sends an email" do
      email = JSON.parse(WelcomeEmail.new(user).welcome)
      expect(email["message"]).to eq("Queued. Thank you.")
    end
  end
end
