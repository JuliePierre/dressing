Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :outfits, only: [ :index, :new, :create, :show, :update ]
  resources :users, only: [ :index, :show ] do
    resources :dressing_items, only: [ :new, :create, :index ]
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
