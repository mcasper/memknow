class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :proposed_answer
      t.integer :quality
      t.date :review_date
      t.belongs_to :flashcard, null: false

      t.timestamps null: false
    end
  end
end
