Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index, :create, :destroy]
    resources :categories, only: :index
  end
  root 'store#show'
end

