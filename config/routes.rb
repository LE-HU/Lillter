Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  root "static_pages#home"
  get "/readme", to: "static_pages#readme"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"

  resources :users do
    member do
      get :following, :followers
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/guest", to: "sessions#guest"
  delete "/logout", to: "sessions#destroy"

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
