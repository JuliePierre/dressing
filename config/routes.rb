Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    member do
      get 'dashboard', to: "users#dashboard"
    end
  end
  resources :friendships

  resources :dressing_items

  resources :shopping_carts, only: [ :show ]

  post "/users/:user_id/vide_dressings/:vide_dressing_id/vide_dressing_items/:id/add_to_cart", to: "vide_dressing_items#add_to_cart", as: :add_to_cart

end
