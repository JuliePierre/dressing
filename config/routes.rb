Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    resources :dressing_items, only: [ :new, :create, :index ]
    resources :vide_dressings, only: [ :new, :create, :show, :update ] do
      resources :vide_dressing_items, only: [ :new, :create, :show, :edit, :update ]
    end
    member do
      get 'dashboard', to: "users#dashboard"
    end
    member do
      get 'dressing', to: "users#dressing"
    end
    member do
      get 'cart', to: "users#cart"
    end
  end
  namespace :all do
    resources :vide_dressings, only: :index
  end

  resources :shopping_carts, only: [ :show ]
  post "/users/:user_id/vide_dressings/:vide_dressing_id/vide_dressing_items/:id/add_to_cart", to: "vide_dressing_items#add_to_cart", as: :add_to_cart

  resources :friendships

  resources :outfits, only: [ :index, :new, :create, :show, :update ]
  resources :proposals, only: [ :new, :create ]
  resources :ceremonies, only: [ :create ]
  post "outfits/:id/upvote", to: "outfits#upvote", as: :upvote
end
