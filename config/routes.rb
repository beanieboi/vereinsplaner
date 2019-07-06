Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resource :dashboard, only: [:show]

  resources :documents
  resources :members
  resources :payments, except: [:edit]
  resources :sessions, only: [:new, :create]

  root to: "dashboards#show"
end
