Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions',
    passwords: 'passwords',
    confirmations: 'confirmations'
  }

  root 'dashboard#home'

  resources :users
end
