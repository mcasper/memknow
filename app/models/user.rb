class User < ActiveRecord::Base
  has_many :flashcards
  has_many :scheduled_reviews
end
