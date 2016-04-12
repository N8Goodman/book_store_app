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

  devise_for :users

  namespace :admin do
    resources :users
  end
end
