class ScheduledDateToDateTime < ActiveRecord::Migration
  def change
    ScheduledReview.destroy_all

    change_column :scheduled_reviews, :scheduled_date, :datetime, null: :false
  end
end
