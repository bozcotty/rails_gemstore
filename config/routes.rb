Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :products, only: [:index, :create, :update, :destroy]
    resources :categories, only: :index
  end

  get 'admin/index'
  root 'store#show'

end


