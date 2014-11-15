class AddLastIntervalToFlashcards < ActiveRecord::Migration
  def change
    add_column :flashcards, :last_interval, :integer, default: 0
  end
end
