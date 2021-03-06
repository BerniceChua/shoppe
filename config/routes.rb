Rails.application.routes.draw do

  get 'products/index'

  resources :users, :products, :categories, :carts, :carts_product

  root "categories#index"

  get 'admin/index', to: 'admin#index'

  get 'users/new', to: 'users#new'

  post 'users/new', to: 'users#create'

  get 'users/:id', to: 'users#show'

  get 'users/:id/edit', to: 'users#edit'

  get 'session-viewer', to: 'sessions#viewer'

  get 'sessions/new', to: 'sessions#new'

  post 'sessions/new', to: 'sessions#create'

  get 'sessions/logout', to: 'sessions#destroy'

  patch 'carts_products/:id', to: 'carts_products#update'

  post 'carts_products', to: 'carts_products#create'

  post 'carts/:id/checkout', to: 'carts_products#checkout'

  delete 'carts_products/:id', to: 'carts_products#destroy'

  delete '/', to: 'carts_products#destroy'

end
