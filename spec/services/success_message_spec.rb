require "rails_helper"

RSpec.describe SuccessMessage do
  describe ".message" do
    it "returns a randomized message" do
      text = SuccessMessage.new.message

      expect(text.present?).to be true
    end
  end
end
