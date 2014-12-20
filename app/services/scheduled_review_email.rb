class ScheduledReviewEmail
  attr_accessor :scheduled_review

  API_KEY = "key-5c882c3bef7fb13442232a587543ce20"
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/cattmasper.com"

  def initialize(scheduled_review)
    @scheduled_review = scheduled_review
  end

  def next_review
    RestClient.post API_URL+"/messages",
      from: "study@cattmasper.com",
      to: "#{scheduled_review.user.email}",
      subject: "Stop! Study time",
      text: message
  end

  def message
    File.read("app/views/scheduled_review_mailer/new_review_scheduled.text.erb")
  end
end
