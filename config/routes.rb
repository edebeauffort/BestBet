Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pools, only: [:new, :create]
  resources :selections, only: [:create]
  resources :bets
 devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
