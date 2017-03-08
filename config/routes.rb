Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pools, only: [:create, :new, :show, :update] do
    member do
      get :participants
    end
    resources :selections, only: [:create]
  end

  resources :bets, only: [:show, :index, :create]

  resources :users, only: [:show, :update, :edit]
  resources :chats, only: [:create]
  resources :messages, only: [:create, :show]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  get '/deposit', to: 'users#deposit'

  get '/refresh_part', to: 'pools#refresh_part'


  patch "/pools/:id/declare_winner", to: "pools#declare_winner", as: :declare_winner


end
