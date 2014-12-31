class ScheduledReviewEmailWorker
  include Sidekiq::Worker

  def perform(scheduled_review)
    RestClient.post ENV["API_URL"] + "/messages",
      from: "study@memknow.com",
      to: "#{scheduled_review.user.email}",
      subject: "Stop! Study time",
      text: message(scheduled_review)
  end

  def message(scheduled_review)
"Hey smartypants,

Looks like you're about to forget something. Here it is: http://memknow-test.herokuapp.com/scheduled_reviews/#{scheduled_review.id}

Just take a look at your flashcards whenever you have a spare second today and then get on your merry way.

Your study buddy,
Memknow

PS. If you have a friend who isn't as smart as you, forward them this email. The world will thank you."
  end
end

