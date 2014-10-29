Rails.application.routes.draw do
  root 'products#index'

  resources :categories
  resources :products
end

