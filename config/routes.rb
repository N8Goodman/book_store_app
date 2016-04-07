Rails.application.routes.draw do
  root 'bookstores#index'

  resources :bookstores do
    resources :reviews
  end

  resources :reviews do
    resources :comments
    post 'upvote'
    post 'downvote'
  end

  devise_for :users
end
