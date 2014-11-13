class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.belongs_to :user
      t.belongs_to :deck
      t.belongs_to :scheduled_review

      t.timestamps null: false
    end

    add_index :flashcards, :user_id
    add_index :flashcards, :deck_id
    add_index :flashcards, :scheduled_review_id
  end
end
