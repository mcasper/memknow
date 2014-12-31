# == Schema Information
#
# Table name: scheduled_reviews
#
#  id             :integer          not null, primary key
#  scheduled_date :date             not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_scheduled_reviews_on_user_id  (user_id)
#

class ScheduledReview < ActiveRecord::Base
  belongs_to :user

  has_many :flashcards

  def scheduled_time
    scheduled_date + 6.hours
  end
end
