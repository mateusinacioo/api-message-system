Rails.application.routes.draw do

  devise_for :users, 
    controllers: { sessions: 'users/sessions', registrations: 'users/accounts' }

  root to: 'home#index', as: :authenticated_root
  
  get "/users/sign_in", to: "users/sessions#new"
  
  resources :webhooks, only: [:create, :update]
  
  get "up" => "rails/health#show", as: :rails_health_check
end