Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :outfits, only: [ :index, :new, :create, :show, :update ]
  resources :users, only: [ :index, :show ]
  resources :proposals, only: [ :new, :create ]
  resources :friendships
  post "outfits/:id/upvote", to: "outfits#upvote", as: :upvote
end
