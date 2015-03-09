Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create]
  end

  root to: 'dashboard#index'
end
