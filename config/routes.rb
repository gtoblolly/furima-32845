Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :order, only: [:index, :create]
    resources :address, only: :create
  end
end