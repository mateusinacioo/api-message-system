Rails.application.routes.draw do

  devise_for :users, 
    controllers: { registrations: 'users/accounts' }

  root to: 'home#index', as: :authenticated_root

  resources :messages
  
  resources :webhooks, only: [:create, :update]
  
  get "up" => "rails/health#show", as: :rails_health_check
end