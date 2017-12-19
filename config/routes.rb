Rails.application.routes.draw do
  get 'missing_item_targets/destroy'

  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :show] do
    member do
      get 'dashboard', to: "users#dashboard"
      get 'boutique', to: "users#boutique"
    end
    member do
      get 'wishlist', to: "users#wishlist"
    end
  end
  resources :friendships

  resources :dressing_items do
    resources :loans, only: [ :create, :update, :destroy ]
  end

  resources :missing_items, only: [ :new, :create ]do
    resources :proposals, only: [ :create ]
  end

  resources :missing_item_targets, only: [ :destroy ]


  resources :shopping_carts, only: [ :show ]

  resources :shopping_cart_items, only: [ :destroy ]

  post "/dressing_items/:id/add_to_cart", to: "dressing_items#add_to_cart", as: :add_to_cart
  post "/dressing_items/:id/add_to_favorite", to: "dressing_items#add_to_favorite", as: :add_to_favorite
  patch "/dressing_items/:id/remove_from_favorite", to: "dressing_items#remove_from_favorite", as: :remove_from_favorite
end
