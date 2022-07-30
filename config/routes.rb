Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :messages, only: ['index'] do
    member do
      resources :likes, only: ['create']
    end
  end
  resources :users
  resources :likes, only: ['destroy']
  resources :goals, only: ['create', 'index']
  # resources :goals, only: ['create']
  # get 'goals/:user_id', to: 'goals#index'
  # get 'goals/:current_user_id', to: 'goals#index'
  resources :threemonths_goals, only: ['create', 'index']
end
