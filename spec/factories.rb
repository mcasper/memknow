FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :flashcard do
    question "What is the meaning of life, the universe, and everyhing?"
    answer "Why, 42 of course"
    difficulty 2.5
    user User.first
  end

  factory :review do
    score 3
    review_date Date.today - 1.day
    flashcard Flashcard.first
  end

  factory :user do
    first_name "Matt"
    last_name "Casper"
    email
    password "password"
    password_confirmation "password"
  end

  factory :scheduled_review do
    scheduled_date Date.today
  end
end
