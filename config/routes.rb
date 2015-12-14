Rails.application.routes.draw do
  #
  # get 'order_items/create'
  #
  # get 'order_items/update'
  #
  # get 'order_items/destroy'

  get "/cart" => "order_items#cart"
  get "/checkout" => "orders#checkout"

  root 'products#index'

  resources :products do
    post "/review", to: "products#review"
    resources :order_items
  end

  resources :orders, only: [:show, :update]

  resources :users do
    post "/categories/new", to: "users#new_category"
    resources :orders do
      post "/ship", to: "orders#ship"
    end
    resources :products do
      post "/retire", to: "products#retire"
    end
  end

  resources :sessions, :only => [:new, :create]
  delete "/logout", to: "sessions#destroy", as: :logout

end
