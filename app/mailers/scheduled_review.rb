class ScheduledReview < ActionMailer::Base
  default from: "study@memknow.com"

  def new_review_scheduled
    @greeting = "Hi"

    mail to: "#{user.email}"
  end
end
