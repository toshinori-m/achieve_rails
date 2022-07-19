Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :messages, only: ['index'] do
    member do
      resources :likes, only: ['create']
    end
  end
  resources :likes, only: ['destroy']
  resources :goals, only: ['create', 'index']
  resources :threemonths_goals, only: ['new' ,'create', 'index']
end
