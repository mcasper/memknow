# == Schema Information
#
# Table name: scheduled_reviews
#
#  id             :integer          not null, primary key
#  scheduled_time :datetime
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ScheduledReview < ActiveRecord::Base
  belongs_to :user

  has_many :flashcards

end
