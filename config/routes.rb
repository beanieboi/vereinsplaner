Rails.application.routes.draw do
  resource :dashboard, only: [:show]

  resources :members
  resources :payments, except: [:edit]
  resources :sessions, only: [:new, :create]

  root to: "dashboards#show"
end
