Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pools, only: [:create,:new,:show] do
    resources :selections, only: [:create]
  end

  resources :bets, only: [:show, :index, :create]

  resources :users, only: [:show, :update, :edit]
  resources :chats, only: [:create]
  resources :messages, only: [:create, :show]

  get '/deposit', to: 'users#deposit'
  patch '/deposit', to: 'users#update_deposit'
  post "/pools/:id/declare_winner" => "pools#declare_winner", as: :declare_winner

end
