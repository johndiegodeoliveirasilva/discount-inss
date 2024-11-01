Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :proposers, only: %w[create new index show] do
    resources :finances, only: :new
  end

  get "report", to: "reports#show", as: "report_screen"
end
