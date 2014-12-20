class ScheduledReviewEmail
  attr_accessor :scheduled_review

  def initialize(scheduled_review)
    @scheduled_review = scheduled_review
  end

  def next_review
    RestClient.post ENV["API_URL"] + "/messages",
      from: "study@memknow.com",
      to: "#{scheduled_review.user.email}",
      subject: "Stop! Study time",
      text: message
  end

  def message
    File.read("app/views/scheduled_review_mailer/new_review_scheduled.text.erb")
  end
end
