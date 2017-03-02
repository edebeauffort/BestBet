Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pools, only: [:create,:new,:show] do
    resources :selections, only: [:create]
  end

  resources :bets, only: [:show, :index, :create]
<<<<<<< HEAD
  resources :users, only: [:show, :edit]
=======
  resources :users, only: [:show, :update]

  get '/deposit', to: 'users#deposit'
>>>>>>> eb6abb0a88cacb9ac31cf9ba9acf997e76d90e8e

  post "/pools/:id/declare_winner" => "pools#declare_winner", as: :declare_winner

end
