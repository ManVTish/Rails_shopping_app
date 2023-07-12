Rails.application.routes.draw do
  resources :products, only: %i[index show] do
    resources :reviews, only: :create
  end

  resources :carts, only: :create do
    # member do
    #   get  :cart_products
    # end
  end
  get '/carts/index', to: 'carts#cart_products'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
end
