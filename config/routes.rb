Rails.application.routes.draw do
  root "users#new"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "signout", to: "sessions#destroy"

  resources :flashcards
  resources :scheduled_reviews, only: [:show]
  resources :reviews, only: [:create]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
end
