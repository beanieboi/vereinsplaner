Rails.application.routes.draw do
  resource :dashboard, only: [:show]

  resources :documents
  resources :members
  resources :payments, except: [:edit]
  resources :statistics, only: [:index]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:index, :update]
  delete '/signout', to: "sessions#destroy", as: :signout

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users
  end

  root to: "dashboards#show"
end
