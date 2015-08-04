Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :sessions, only: :create
    resources :meals, only: [:create, :show]
    resources :ingredients, only: :index
  end
end
