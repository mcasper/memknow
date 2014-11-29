class EditReviewsTable < ActiveRecord::Migration
  def change
    remove_column :reviews, :proposed_answer
    rename_column :reviews, :quality, :score
  end
end
