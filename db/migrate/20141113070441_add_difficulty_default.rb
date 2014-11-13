class AddDifficultyDefault < ActiveRecord::Migration
  def change
    change_column :flashcards, :difficulty, :decimal, default: 2.5
  end
end
