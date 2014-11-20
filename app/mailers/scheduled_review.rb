class ScheduledReview < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.scheduled_review.new_review_scheduled.subject
  #
  def new_review_scheduled
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
