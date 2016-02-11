Rails.application.routes.draw do
  get 'products/index'

  resources :users, :products, :categories

  root "categories#index"

  get 'admin/index'

  get 'users/new', to: 'users#new'

  post 'users/new', to: 'users#create'

  get 'users/:id', to: 'users#show'

  get 'users/:id/edit', to: 'users#edit'

  get 'session-viewer', to: 'sessions#viewer'

  get 'sessions/new', to: 'sessions#new'

  post 'sessions/new', to: 'sessions#create'

  get 'sessions/logout', to: 'sessions#destroy'

end
