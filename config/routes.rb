Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'home#index', as: :authenticated_root
  
  get "/users/sign_in", to: "users/sessions#new"
  post 'webhooks/create_users', to: 'webhooks#create_users'
  patch 'webhooks/update_users/:id', to: 'webhooks#update_users'
  
  get "up" => "rails/health#show", as: :rails_health_check

end