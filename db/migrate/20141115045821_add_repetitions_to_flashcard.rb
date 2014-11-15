class AddRepetitionsToFlashcard < ActiveRecord::Migration
  def change
    add_column :flashcards, :repetitions, :integer, default: 0
  end
end
