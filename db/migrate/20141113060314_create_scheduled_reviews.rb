class CreateScheduledReviews < ActiveRecord::Migration
  def change
    create_table :scheduled_reviews do |t|
      t.date :scheduled_date, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end

    add_index :scheduled_reviews, :user_id
  end
end
