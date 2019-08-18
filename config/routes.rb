Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resource :dashboard, only: [:show]

  resources :documents
  resources :members
  resources :payments, except: [:edit]
  resources :statistics, only: [:index]
  resources :sessions, only: [:new, :create]
  delete '/signout', to: "sessions#destroy", as: :signout

  root to: "dashboards#show"
end
