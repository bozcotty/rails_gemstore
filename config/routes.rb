Rails.application.routes.draw do
  root 'products#index'

  resources :categories do
    resources :products
  end
end

