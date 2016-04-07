Rails.application.routes.draw do
  root 'bookstores#index'

  resources :bookstores do
    resources :reviews
  end

  resources :reviews do
    resources :comments
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end

  devise_for :users
end
