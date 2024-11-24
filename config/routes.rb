Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'users/home#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end