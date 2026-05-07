# frozen_string_literal: true

Rails.application.routes.draw do
  resource :dashboard, only: [ :show ]

  resources :members, except: [ :destroy ]
  resources :payments, only: %i[index new create destroy]
  resources :statistics, only: [ :index ]
  resources :sessions, only: %i[new create]
  resources :users, only: %i[index update]
  delete "/signout", to: "sessions#destroy", as: :signout

  namespace :admin do
    resources :dashboard, only: [ :index ]
    resources :users, except: %i[index show]
  end

  root to: "dashboards#show"
end
