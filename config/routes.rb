Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pools, only: [:create,:new,:show]
  resources :selections, only: [:create]
resources :bets, only: [:create, :show]
 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
