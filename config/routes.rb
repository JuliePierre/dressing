Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users, only: [:index, :show] do
    resources :dressing_items, only: [ :new, :create, :index ]
    resources :vide_dressings, only: [ :new, :create, :index, :show, :update ] do
      resources :vide_dressing_items, only: [ :new, :create, :show ]
    end
    member do
      get 'dashboard', to: "users#dashboard"
    end
    member do
      get 'dressing', to: "users#dressing"
    end
  end
  namespace :all do
    resources :vide_dressings, only: :index
  end
  resources :friendships

  resources :outfits, only: [ :index, :new, :create, :show, :update ]
  resources :proposals, only: [ :new, :create ]
  resources :ceremonies, only: [ :create ]
  post "outfits/:id/upvote", to: "outfits#upvote", as: :upvote
end
