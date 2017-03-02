Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pools, only: [:create,:new,:show] do
    resources :selections, only: [:create]
  end
<<<<<<< HEAD
  resources :bets, only: [:show, :index, :create]
=======
  resources :bets, only: [:show, :index]
  resources :users, only: [:show]

  post "/pools/:id/declare_winner" => "pools#declare_winner", as: :declare_winner
>>>>>>> f85cdd6495b53cfb617b3534c02de7e94bfbc92f
end
