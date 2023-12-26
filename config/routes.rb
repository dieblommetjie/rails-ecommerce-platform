# frozen_string_literal: true

Rails.application.routes.draw do
  root 'store#index'

  resources :users
  resources :products
  resources :categories, only: %i[index show]

  resource :cart, only: %i[show update destroy] do
    get 'add_item/:product_id', to: 'carts#add_item', as: :add_item_to
    get 'remove_item/:product_id', to: 'carts#remove_item', as: :remove_item_from
  end

  resources :orders do
    resources :order_items, only: %i[create update destroy]
  end

  # Additional routes as needed
end
