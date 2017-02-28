Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pools, only: [:create,:new,:show] do
    resources :selections, only: [:create] do
      resources :bets, only: [:create, :show]
    end
  end
  resources :bets, only: [:show, :index]
end
