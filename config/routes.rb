require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'
  root to: 'home#index'

  resources :proposers, only: %w[create new index show edit update destroy] do
    resources :finances, only: %w[new] do
      collection do
        post :calculate
        post :sync_tax
      end
    end
  end
end
