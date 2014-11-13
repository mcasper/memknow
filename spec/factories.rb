FactoryGirl.define do
  factory :flashcard do
    question "What is the meaning of life, the universe, and everyhing?"
    answer "Why, 42 of course"
    difficulty 2.5
    user User.first
  end

  factory :review do
    proposed_answer "Is it 42?"
    quality 3
    review_date Date.today - 1.day
    flashcard Flashcard.first
  end

  factory :user do
    first_name "Matt"
    last_name "Casper"
    login "mattcasper@example.com"
    password "password"
    is_admin true
  end
end
