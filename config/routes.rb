Rails.application.routes.draw do
  root "home#index"

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  devise_for :users

  resources :flashcards
end
