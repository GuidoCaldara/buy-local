Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :merchants
  root to: 'pages#home'
  namespace :merchant do
    resources :products
    resources :stores
    resources :orders
  end
  resources :carts, only: [:index, :edit, :show, :destroy] do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:show, :edit, :destroy] do
    resources :delivery_infos, only: [:new, :create]
    resources :payments, only: [:new, :create]
    member do
      get :delivery_info
    end
  end
  resources :delivery_infos, only: [:edit, :update]

  resources :stores, only: [:index, :show] do
    collection do
      get :filter_categories
    end
  end
  resources :products, only: [:show] do
    resources :cart_products, only:[:new, :create]
  end
  resources :cart_products, only: [:destroy] do
    member do
      patch :add
      patch :remove
    end
  end
  resources :users do
    collection do
      get :new_access_modal
    end
  end

  get 'dashboard', to: "users#dashboard", as: :user_dashboard
  get 'store_dashboard', to: "merchants#dashboard", as: :merchant_dashboard
  get 'merchant/search_products', to: "merchant/products#search_products", as: :search_merchant_products
  get 'merchant/merchant_products_list', to: "merchant/products#merchant_products_list", as: :merchant_products_view
  get "stripe/connect", to: "stripe#connect", as: :stripe_connect

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
