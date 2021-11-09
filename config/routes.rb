Rails.application.routes.draw do
  devise_for :users
  resources :books
  root to: "books#index"
  get "/search", to: "books#search"
  get "/buy/:book_id", to: "orders#buy", as: "buy"
  get "/success", to: "orders#success", as: "success"
  get "/cancel", to: "orders#cancel", as: "cancel"
  get '/add_to_cart/:book_id', to: "carts#add_to_cart", as: "add_to_cart"
  get '/buy', to: "carts#buy", as: 'checkout_buy'
  get '/cart', to: "carts#cart", as: "cart"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
