module ApplicationHelper
  def current_scheduled_review
    current_user.scheduled_reviews.find_by(scheduled_date: Date.today)
  end

  def flashcards_count
    if current_scheduled_review
      current_scheduled_review.flashcards.count
    else
      0
    end
  end

  def user_date
    current_user.signup_date
  end
end
