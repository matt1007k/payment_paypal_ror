Rails.application.routes.draw do

  resources :products
  resources :in_shopping_carts, only: [:create, :destroy]
  devise_for :users
  root 'home#index'
  get '/carrito', to: 'shopping_carts#show'
  get '/add/:product_id', as: :add_to_cart,to: "in_shopping_carts#create"
  get '/checkout', to: 'payments#checkout'

  post '/pagar', to: 'payments#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
