Rails.application.routes.draw do
  root "sessions#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "signout", to: "sessions#destroy"

  resources :flashcards
  resources :scheduled_reviews, only: [:index, :show]
  resources :reviews, only: [:create]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
end
