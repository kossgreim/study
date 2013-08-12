Study::Application.routes.draw do
  resources :orders

  resources :line_items

  resources :carts

  get "store/index"
  resources :products

  resources :products
  resources :store

  resources :products do 
    get :who_bought, on: :member
  end

  root to: 'store#index'
end
