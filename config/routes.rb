Rails.application.routes.draw do
  root "home#index"

  devise_scope :user do
  end

  devise_for :users, controller: { sessions: "sessions" }

  resources :flashcards
end
