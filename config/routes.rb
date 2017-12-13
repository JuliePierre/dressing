Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    member do
      get 'dashboard', to: "users#dashboard"
    end
    member do
      get 'wishlist', to: "users#wishlist"
    end
  end
  resources :friendships

  resources :dressing_items do
    resources :loans, only: [ :create, :update, :destroy ]
  end

  resources :shopping_carts, only: [ :show ]

  resources :shopping_cart_items, only: [ :destroy ]

  post "/dressing_items/:id/add_to_cart", to: "dressing_items#add_to_cart", as: :add_to_cart
  post "/dressing_items/:id/add_to_favorite", to: "dressing_items#add_to_favorite", as: :add_to_favorite
  patch "/dressing_items/:id/remove_from_favorite", to: "dressing_items#remove_from_favorite", as: :remove_from_favorite
end
