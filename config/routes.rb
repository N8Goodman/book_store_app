Rails.application.routes.draw do
  root 'bookstores#index'
  devise_for :users

  resources :bookstores do
    resources :reviews
  end

  resources :reviews do
    resources :votes, only: [:create] do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end

  namespace :admin do
    resources :users
  end
end
