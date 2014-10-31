Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index, :create, :update, :destroy]
    resources :categories, only: :index
  end

  get 'admin/index'
  root 'store#show'

end


