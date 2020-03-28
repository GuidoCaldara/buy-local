Rails.application.routes.draw do
  devise_for :merchants
  root to: 'pages#home'
  namespace :merchant do
    resources :products
    resources :stores
    resources :orders
  end

  get 'store_dashboard', to: "merchants#dashboard", as: :merchant_dashboard
  get 'merchant/search_products', to: "merchant/products#search_products", as: :search_merchant_products
  get 'merchant/merchant_products_list', to: "merchant/products#merchant_products_list", as: :merchant_products_view
  devise_for :users
  get "stripe/connect", to: "stripe#connect", as: :stripe_connect

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
