Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise_auth/registrations',
    sessions: 'devise_auth/sessions',
    passwords: 'devise_auth/passwords',
    confirmations: 'devise_auth/confirmations'
  }

  root 'dashboard#home'

  resources :users
end
