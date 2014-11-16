Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :flashcards
  resources :scheduled_reviews, only: [:show]
end
