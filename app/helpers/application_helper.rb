module ApplicationHelper
  def current_scheduled_review
    current_user.scheduled_reviews.where(scheduled_date: Date.today).first
  end

  def user_date
    current_user.signup_date
  end
end
