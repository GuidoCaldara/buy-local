Rails.application.routes.draw do
  devise_for :models
  root to: 'pages#home'
  devise_for :shops
  namespace :shop do
    resources :products
    resources :stores
    resources :orders
  end

  get 'store_dashboard', to: "shops#dashboard", as: :shop_dashboard
  get 'shop/search_products', to: "shop/products#search_products", as: :search_shop_products
  get 'shop/shop_products_list', to: "shop/products#shop_products_list", as: :shop_products_view
  devise_for :users
  get "stripe/connect", to: "stripe#connect", as: :stripe_connect

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
