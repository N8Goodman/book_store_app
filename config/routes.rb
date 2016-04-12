Rails.application.routes.draw do
  root 'bookstores#index'
  devise_for :users

  resources :bookstores do
    resources :reviews
  end

  resources :reviews do
    resources :comments
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index, :update, :destroy]
    resources :bookstores, only: [:index, :edit, :update, :destroy]
    resources :reviews, only: [:destroy]
  end
end
