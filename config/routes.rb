Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :proposers, only: :create

  get "report", to: "reports#show", as: "report_screen"
end
