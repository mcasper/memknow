Rails.application.routes.draw do
	root "users#new"

	get "signin", to: "sessions#new"
	post "signin", to: "sessions#create"
	delete "signout", to: "sessions#destroy"

  resources :flashcards do
    resources :reviews, only: [:create]
  end
  resources :scheduled_reviews, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
end
