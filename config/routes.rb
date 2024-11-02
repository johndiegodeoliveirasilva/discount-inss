Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :proposers, only:%w[create new index show edit update destroy] do
    get "finances/calculate", to: "finances#calculate"
    post "finances/sync_tax", to: "finances#sync_tax"

    resources :finances, only: %w[new] do
    end
  end

  get "report", to: "reports#show", as: "report_screen"
end
