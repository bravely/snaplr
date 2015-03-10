Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    member do
      get 'follow'
      get 'unfollow'
    end
    resources :posts, only: [:new, :create]
  end

  get '/public', to: 'dashboard#public'
  root to: 'dashboard#index'
end
