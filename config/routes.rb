Rails.application.routes.draw do
  get 'vide_dressing_items/new'

  get 'vide_dressing_items/create'

  get 'vide_dressings/new'

  get 'vide_dressings/create'

  get 'vide_dressings/index'

  get 'vide_dressings/show'

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }

  root to: 'pages#landing'
  get 'accueil', to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :outfits, only: [ :index, :new, :create, :show, :update ]
  resources :users, only: [:index, :show] do
    resources :dressing_items, only: [ :new, :create, :index ]
    resources :vide_dressings, only: [ :new, :create, :index, :show, :update ] do
      resources :vide_dressing_items, only: [ :new, :create ]
    end
    member do
      get 'dashboard', to: "users#dashboard"
    end
    member do
      get 'dressing', to: "users#dressing"
    end
  end
  resources :proposals, only: [ :new, :create ]
  resources :ceremonies, only: [ :create ]
  resources :friendships
  post "outfits/:id/upvote", to: "outfits#upvote", as: :upvote
end
