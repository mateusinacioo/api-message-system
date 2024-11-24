Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index', as: :authenticated_root
  
  get "/users/sign_in", to: "users/sessions#new"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end