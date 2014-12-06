class ScheduledReviewMailer < ActionMailer::Base
  default from: "study@memknow.com"

  def new_review_scheduled(scheduled_review)
    @scheduled_review = scheduled_review

    mail to: "#{scheduled_review.user.email}", subject: "Stop! Study time"
  end
end
