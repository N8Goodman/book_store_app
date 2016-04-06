Rails.application.routes.draw do
  root 'bookstores#index'

  resources :bookstores do
    resources :reviews
  end

  resources :reviews do
    resources :comments
  end

  devise_for :users
end
