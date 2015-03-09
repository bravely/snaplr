Rails.application.routes.draw do
  resources :posts, only: [:new, :create]

  devise_for :users
  root to: 'dashboard#index'
end
